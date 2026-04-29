[⊞ ◈] [☵ ☳ ☶ ☲]

# ProcessCards Minor Core Handoff

This document is now a legacy minor-only handoff
for the earlier `5-slot` branch.

It remains useful as historical prototype entry,
but it is no longer the current board canon.

Superseded by:

- [BOARD_CANON_v1.md](BOARD_CANON_v1.md)
- [WIN_CHECK_LAW.md](WIN_CHECK_LAW.md)

---

This document is the shortest correct handoff for a machine
that needs to understand the current core gameplay of `ProcessCards`
without the trump layer.

It is not the full game.
It is not the full yellowprint.
It is the current minor-only machine.

---

## 0. What This Is

`ProcessCards` is a solitaire-like process card game derived from `ProcessLang` topology.

For the current core handoff,
ignore trumps.
Ignore victory conditions.
Ignore full target compiler logic.

Read only:

```text
100 minor cards
one-screen minor machine
manifest-row-centered gameplay
weak / strong / discard / pass
```

Short formula:

```text
current playable core = minor-only manifest machine
```

---

## 1. Board Model

The current machine uses these zones:

- `deck`
- `hand`
- `manifest row`
- `latent row`
- `targets`
- `runtime lane`
- `grave`
- `log`

The structural board model is:

```text
5 columns × 2 layers
```

But the active move surface of the current core loop is only:

```text
manifest row
```

So ordinary play acts on visible manifest cards,
not directly on latent cards.

---

## 2. Card Model

The current handoff assumes:

```text
100 minor cards
10 operator suits
10 numbers
```

Each minor card is an ordered pair:

```text
(operator, number)
```

For move legality:

- `suit` = operator glyph
- `number` = card number `1..10`

For effect reading:

- weak play reads one operator-layer effect
- strong play reads one combined pair meaning

Important:

```text
strong is not A then B
strong is one combined reading of the pair
```

---

## 3. Core Loop

A turn currently supports:

- `play`
- `discard`
- `pass`

`play` may resolve as:

- `weak`
- `strong`

depending on legality.

The current minimal loop is:

1. select a card from hand
2. select a visible target in manifest row
3. determine legal move type
4. resolve weak or strong if legal
5. otherwise use discard or pass

---

## 4. Weak Move

Weak legality is UNO-like:

```text
same number
OR
same suit
```

More formally:

```text
weak legal if
hand.number == target.number
or
hand.suit == target.suit
```

Weak procedure:

1. choose a card from hand
2. choose a target card in manifest row
3. if weak legal:
   - target manifest card goes to grave
   - played hand card takes its manifest slot
   - resolve 1 weak effect of the played card
   - draw 0

Short formula:

```text
weak = replace target manifest card + 1 card effect
```

---

## 5. Strong Move

Strong legality is not UNO-like.

It uses `ProcessLang` adjacency from:

```text
/home/slasten/Документы/stack/stack-core/ProcessLang/canon.lua
```

Working law:

```text
canon adjacency decides strong legality
```

Strong procedure:

1. choose a card from hand
2. choose a target card in manifest row
3. if strong legal:
   - target manifest card goes to grave
   - played hand card takes its manifest slot
   - draw 2
   - resolve one combined reading of the played pair

Short formula:

```text
strong = replace target manifest card + draw 2 + combined pair reading
```

Important:

```text
deprecated reading:
draw 2 + 1-2 separate effects

current reading:
draw 2 + one combined pair meaning
```

---

## 6. Discard And Pass

Discard:

1. choose a card from hand
2. move it to grave
3. draw 0

Pass:

- legal
- tempo-negative
- should remain possible but undesirable

If pass becomes frequent,
the machine is not creating enough pressure.

---

## 7. Latent, Targets, Runtime

These zones already exist in the board model,
but are not yet full ordinary move surfaces in the first minor machine.

### Latent row

- physically present
- hidden by default
- not a direct ordinary weak/strong target
- not auto-promoted into manifest by the basic loop

This is a prototype limitation,
not final truth of the game.

### Targets

- present as a 3-slot surface
- future compiler surface
- not part of ordinary core move targeting

### Runtime lane

- present
- structurally important
- capacity = 1
- may remain passive in the first playable minor loop

---

## 8. Grave

`grave` is:

- open
- ordered
- public

New cards are added on top.

This matters because grave is not just discard.
It is ordered residue.

---

## 9. Physical-Card Law

The machine must remain physically playable on real cards.

That means:

- only visible manifest cards are ordinary move targets
- hidden information stays hidden unless a rule reveals it
- replacement of manifest cards must be physically clear
- grave order must be readable
- UI may highlight legality,
  but cannot depend on digital-only hidden bookkeeping

Short formula:

```text
if cardboard cannot do it,
the prototype cannot rely on it
```

---

## 10. Operator Law

Minor cards use operator families from the current table canon.

Do not invent effects from glyph flavor.
Read operators through the current operator docs.

Current strong law:

```text
weak = one operator reading
strong = one combined pair reading
```

Important routing:

- pairs containing `☰` are governed by `CONNECT_LAW`
- pairs containing `☶` may use logic override
- not every pair is mature enough to code

So:

```text
do not assume full pair table completion
```

---

## 11. What To Send A Machine

If you want to show another machine only the current core game,
send these documents in this order:

1. this file
2. `/home/slasten/dev/processcards/docs/crystall/FIRST_LOVE_PROTOTYPE_TZ.md`
3. `/home/slasten/dev/processcards/docs/table/MINOR_MACHINE.md`
4. `/home/slasten/dev/processcards/docs/table/OPERATORS_INDEX.md`
5. `/home/slasten/dev/processcards/docs/table/STRONG_COMBINED_LAW.md`
6. `/home/slasten/dev/processcards/docs/table/STRONG_PAIR_TABLE.md`

If it needs exact family details after that,
then send:

```text
/home/slasten/dev/processcards/docs/table/operators/*.md
```

If it needs trump design,
send trump docs separately.

---

## 12. Short Formula

```text
ProcessCards minor core
= 100-card manifest-row machine
+ weak by same number/suit
+ strong by ProcessLang adjacency
+ strong reads one combined pair meaning
+ latent/targets/runtime already exist,
  but do not yet define the ordinary move loop
```

---

machines only. not for humans.
