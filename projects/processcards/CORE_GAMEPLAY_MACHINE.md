# ProcessCards — Core Gameplay Machine

## 0. Статус

Машинно-читаемое описание core gameplay loop для inter_ai агентов.
Не human-facing документ. Не дизайн-документ. Не правила для игрока.

Это спецификация игровой машины: зоны, карты, ход, операторы, козыри, victory.
Написано в формате: declaration → pseudocode → constraint.

---

## 1. Board Model

### 1.1 Зоны

```
ZONES {
  deck              stack      -- колода, face-down по умолчанию
  hand              fan        -- рука игрока, intervention reservoir
  manifest          slots[6]   -- открытый ряд мира, всегда revealed
  latent            slots[6]   -- скрытый подпирающий ряд, hidden по умолчанию
  targets           slots[3]   -- victory compiler, hidden по умолчанию
  runtime           slots[1]   -- зона установленных карт
  play              slots[1]   -- зона разыгрываемой карты (transit)
  grave             stack      -- сброс, всегда revealed, ordered
  trump_flow        row        -- активная очередь разрешающихся козырей
  trump_zone        slots[2]   -- камера resolved козырей, всегда revealed
}
```

### 1.2 Инварианты доски

```
INVARIANT:
  manifest[1..6] всегда заполнен (нет пустых слотов после repair)
  latent[1..6] всегда заполнен (нет пустых слотов после repair)
  targets[1..3] всегда заполнен (нет пустых слотов после repair)
  runtime capacity = 1
  trump_zone capacity = 2
```

### 1.3 Board closure

```
BOARD_CLOSED :=
  manifest[1..6] all occupied AND
  latent[1..6] all occupied AND
  targets[1..3] all occupied

-- trump resolution не стартует пока board не closed
```

---

## 2. Cards

### 2.1 Minor cards (100 штук)

```
MINOR_CARD {
  id         : string        -- "MINOR-1" .. "MINOR-100"
  class      : "minor"
  op_a       : operator      -- верхний/первый оператор
  op_b       : operator      -- нижний/второй оператор
  info_state : "hidden" | "known" | "revealed"
}

-- 10 × 10 ordered operator pairs
-- AB и BA — разные физические карты в колоде
-- effect reading НЕ зависит от порядка: AB и BA = одна effect family
```

### 2.2 Trump cards (22 штуки)

```
TRUMP_CARD {
  id         : string        -- "TRUMP-1" .. "TRUMP-22"
  class      : "trump"
  op_a       : operator      -- canonical edge pair
  op_b       : operator      -- canonical edge pair
  trump_name : string | nil  -- имя козыря (FOOL, EJECT, ...)
  info_state : "hidden" | "known" | "revealed"
}

-- 22 карты = все unique adjacency-пары из canon.lua
-- AB = BA внутри trump identity (unordered)
-- self-pairs не входят
```

### 2.3 Operators (10 штук)

```
OPERATORS = {FLOW, CONNECT, DISSOLVE, ENCODE, CHOOSE, OBSERVE, CYCLE, LOGIC, RUNTIME, MANIFEST}

GLYPHS = {
  FLOW = "▽", CONNECT = "☰", DISSOLVE = "☷", ENCODE = "☵",
  CHOOSE = "☳", OBSERVE = "☴", CYCLE = "☲", LOGIC = "☶",
  RUNTIME = "☱", MANIFEST = "△"
}
```

### 2.4 Information states

```
INFO_STATE ∈ {"hidden", "known", "revealed"}

-- observe:  hidden → known       (не меняет board state)
-- reveal:   hidden → revealed    (меняет board state)
--           known → revealed     (меняет board state)
-- known → hidden: запрещено по умолчанию
-- revealed → hidden: запрещено по умолчанию

-- revealed implies known
-- known does NOT imply revealed
```

---

## 3. Adjacency (Topology)

### 3.1 Canonical adjacency

```
-- Источник: canon.lua
-- full_pair_fit проверяет что ОБА оператора hand-карты
-- топологически adjacent к ОБОИМ операторам committed manifest-карты

ADJ[FLOW]     = {CONNECT, DISSOLVE, OBSERVE}
ADJ[CONNECT]  = {FLOW, DISSOLVE, OBSERVE, ENCODE}
ADJ[DISSOLVE] = {FLOW, CONNECT, OBSERVE, CHOOSE}
ADJ[ENCODE]   = {CONNECT, OBSERVE, CHOOSE, CYCLE, RUNTIME}
ADJ[CHOOSE]   = {DISSOLVE, OBSERVE, ENCODE, LOGIC, RUNTIME}
ADJ[OBSERVE]  = {FLOW, CONNECT, DISSOLVE, ENCODE, CHOOSE, RUNTIME}
ADJ[CYCLE]    = {ENCODE, LOGIC, MANIFEST, RUNTIME}
ADJ[LOGIC]    = {CHOOSE, CYCLE, MANIFEST, RUNTIME}
ADJ[RUNTIME]  = {ENCODE, CHOOSE, CYCLE, LOGIC, MANIFEST, OBSERVE}
ADJ[MANIFEST] = {CYCLE, LOGIC, RUNTIME}
```

### 3.2 Full pair fit

```
function full_pair_fit(manifest_card, hand_card):
    -- проверка в двух перестановках
    return (
        ADJ[manifest_card.op_a][hand_card.op_a] AND
        ADJ[manifest_card.op_b][hand_card.op_b]
    ) OR (
        ADJ[manifest_card.op_a][hand_card.op_b] AND
        ADJ[manifest_card.op_b][hand_card.op_a]
    )

-- No orphan operator allowed:
-- если ОДИН оператор hand-карты находит пару а второй нет → ход нелегален
```

---

## 4. Turn Structure

### 4.1 Фазы хода

```
PHASES {
  await_start      -- ничего не выбрано, можно выбрать manifest ИЛИ hand
  await_complete   -- выбрано ровно одно (committed manifest ИЛИ armed hand)
  await_ready      -- выбраны оба (committed + armed), △ активен
}
```

### 4.2 Cast/commit sequence

```
TURN:

  -- Шаг 1: commit manifest-карты (игрок кликает слот)
  state.committed = {card_id = manifest[i], slot = i}
  state.legal_hints = {}  -- сбрасывается и пересчитывается

  -- Шаг 2: arm hand-карты (игрок кликает карту в руке)
  state.armed_hand = card_id

  -- Шаг 3: △ (игрок подтверждает)
  -- Проверка: committed И armed_hand существуют
  -- Если да → resolve_turn

RESOLVE_TURN:
  1. hand_card  → play[1]           (рука → транзитная зона)
  2. manifest[i] → grave             (мир-узел потреблён)
  3. latent[i] → reveal → manifest[i] (скрытое поднимается)
  4. deck_top → latent[i] hidden     (будущее пополняет скрытый слой)
  5. played_card effect resolves     (эффект оператора)
  6. played_card → grave             (сыгранная карта тратится)
  7. clear_gameplay_selection()      (сброс committed, armed_hand, hints)

-- Важно: world update (шаги 2-4) происходит ДО effect resolution (шаг 5)
-- Эффект всегда играет на уже обновлённом мире
```

### 4.3 Draw procedure

```
DRAW_PROCEDURE:
  card_id = pop_topdeck()
  set_info_state(card_id, "revealed")
  if card.class == "trump":
      enter_trump_flow(card_id, "draw")
      return nil, "trump_burn"    -- trump сжигает этот draw
  else:
      place_card(card_id, "hand")
      return card_id

-- Multi-draw: каждая процедура независима
-- draw 2 = procedure #1, затем procedure #2
-- trump burn сжигает только одну процедуру, остальные продолжаются
```

### 4.4 Manifest repair

```
REPAIR_COLUMN(slot):
  latent_id = latent[slot]
  if latent_id == nil: return
  if card[latent_id].class == "trump":
      enter_trump_flow(latent_id, "latent ascent")
      open_manifest_closure(slot)    -- продолжить добирать пока не найдётся minor
      concealed_refill("latent", slot)
      return
  latent[slot] → reveal → manifest[slot]
  concealed_refill("latent", slot)

-- open_manifest_closure: в цикле достаёт из деки пока не встретит minor
-- trump → trump_flow, minor → manifest[slot]
```

---

## 5. Operator Effects

### 5.1 Effect resolution

```
-- После cast/commit игрок выбирает ОДИН оператор с сыгранной карты
-- Карта несёт два оператора (op_a, op_b), игрок выбирает один для разрешения

RESOLVE_OPERATOR(op):
  match op:
    CONNECT  → draw_procedure() × 2
    CYCLE    → draw_procedure(); discard_one_from_hand()
    OBSERVE  → choose_hidden_card_on_board(); hidden → known
    DISSOLVE → choose_card_in_latent(); latent → grave
    MANIFEST → choose_not_revealed_card(); not_revealed → revealed
    ENCODE   → choose_hidden_target(); swap_with_not_revealed_or_reorder
    CHOOSE   → [arm_manifest_target → confirm → take into hand]
    LOGIC    → [arm_logic_target → confirm → logic effect]
    FLOW     → [move not-revealed card to adjacent concealed position]
    RUNTIME  → [arm hand → move to runtime if runtime-card]

-- Операторная фаза: игрок выбирает оператор → игра запрашивает target → confirm → resolve
```

---

## 6. Trump Ecology

### 6.1 Trump — не minor

```
TRUMP ≠ MINOR:

-- Козыри НЕ могут:
  - попасть в hand как обычная карта (draw вскрыл trump → не в руку, а в trump_flow)
  - попасть в grave (только через специальные эффекты)
  - быть observed (observe не триггерит trump, но смотрит его)
  - быть played как minor-карта из руки

-- Козыри ВСЕГДА:
  - при reveal → trump_flow (не hand, не grave)
  - резолвятся как event, не как state
  - после resolution → trump_zone (если не overflow)
  - при overflow (3-й в zone) → shuffle всей zone обратно в deck
```

### 6.2 Trump lifecycle

```
TRUMP_LIFECYCLE:

  1. trump_card becomes KNOWN или REVEALED
     -- кроме случая: targets override (trump в targets не уходит в flow)

  2. enter_trump_flow(card_id, reason)
     -- карта помещается в trump_flow (активная очередь)

  3. trump_flow ждёт board_closure
     -- пока manifest/latent/targets не все заполнены, resolution не стартует

  4. refresh_pending_trump()
     -- если board closed И trump_flow не пуст: первый в очереди → pending_trump

  5. player confirm (△ или другая кнопка)
     -- игрок явно подтверждает разрешение pending trump

  6. resolve_pending_trump()
     -- trump event разрешается (stub или full effect)

  7. resolve_trump_zone_entry(card_id)
     -- если trump_zone имеет свободный слот: карта → trump_zone
     -- если trump_zone полон (2 карты): overflow flush
        -- все 2 + текущий козырь → shuffle в deck
        -- trump_zone очищается
```

### 6.3 Target zone override

```
TARGET_OVERRIDE:
  если trump становится known/revealed ВНУТРИ targets:
    -- НЕ входит в trump_flow
    -- остаётся в targets
    -- живёт как compiler trump (участвует в victory compilation)
    -- не триггерит немедленное разрешение
```

### 6.4 Trump flow vs Trump zone

```
TRUMP_FLOW  = active resolving queue (сейчас)
TRUMP_ZONE  = resolved residue (после)
-- chain = now, zone = after
-- resolved trumps остаются in-flight до chain close
-- только после chain close → trump_zone
```

---

## 7. Victory Compilation

### 7.1 Target compiler

```
-- targets[1..3] = victory compiler
-- Когда все 3 слота заняты TRUMPS → victory pattern скомпилирован

COMPILE_VICTORY_PATTERN:
  -- 3 trump-карты, каждая = одна edge-пара
  -- каждая пара читается directionally (AB ≠ BA)
  -- upper reading: op_a всех трёх пар → 6-слотная directed sequence
  -- lower reading: op_b всех трёх пар → 6-слотная directed sequence

  -- Только upper ИЛИ только lower, смешанное чтение запрещено
```

### 7.2 Victory check

```
VICTORY_CHECK:
  -- после turn resolution (после effect + после chain close)
  -- если targets НЕ заполнены 3 trump'ами → no check
  -- если targets заполнены:
       derived_pattern = compile_victory_pattern()
       if manifest[1..6] matches derived_pattern in directed order:
           VICTORY
       else:
           continue game

  -- no mid-resolution victory
  -- check only after full turn effect closure
```

---

## 8. Deck Setup

### 8.1 Deck composition

```
DECK = 100 MINORS + 22 TRUMPS = 122 total
```

### 8.2 Two-phase setup

```
SETUP:
  Phase A (minor-only bootstrap):
    shuffle 100 minors
    manifest[1..6] ← from minor_deck (revealed)
    hand[1..6] ← from minor_deck (revealed)
    -- 88 minors remain

  Phase B (full deck):
    add 22 trumps to remaining 88 minors → 110 cards
    shuffle
    targets[1..3] ← from deck (hidden)
    latent[1..6] ← from deck (hidden)
    -- 101 cards remain in deck

  POST-SETUP:
    deck: 101 cards
    hand: 6 minor cards
    manifest: 6 revealed minor cards
    latent: 6 hidden cards (may include trumps)
    targets: 3 hidden cards (may include trumps)
    runtime: empty
    grave: empty
    trump_flow: empty
    trump_zone: empty
```

---

## 9. Core Loop Pseudocode

```
function game_loop():
    state = new_game()
    start_game(state)

    while not victory:
        interaction = read_interaction(state)

        -- фазы: await_start | await_complete | await_ready
        if interaction.phase == "await_start":
            -- игрок выбирает: commit manifest ИЛИ arm hand
            action = wait_for_input()

        if interaction.phase == "await_complete":
            -- одно выбрано: игрок выбирает второе
            -- или deselect (клик по той же карте)
            action = wait_for_input()

        if interaction.phase == "await_ready":
            -- оба выбраны: △ = resolve_turn
            -- или deselect одного из двух
            action = wait_for_input()

        result = apply_action(state, action)

        -- после каждого действия: обновить trump flow
        refresh_pending_trump(state)

        -- если pending trump → показать игроку
        -- игрок подтверждает → resolve_pending_trump

    return VICTORY
```

---

machines only. not for humans.
