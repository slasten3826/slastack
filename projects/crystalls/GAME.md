[⊞ ◈ ▲] [▽ ☴ ☳ ☴ ▽ ☴ ☵ ☴ ☳ ☶ ☲ ☱ △]

# game

## 0. Статус

Черновой crystall-case.

Не читать как entrypoint.
Этот документ предполагает, что уже прочитаны:

- `stack-core/TAG_LEGEND.md`
- `stack-core/PROCESSLANG.md`
- `stack-core/FOUR_LEVELS_OF_ABSTRACTION.md`
- `projects/crystalls/TAIJI.md`
- `projects/crystalls/MILITARY_ONTOLOGY.md`

Главный payload здесь — не теория развлечения.
Главный payload — PL-трасса игры как управляемого crystallization path.

---

## 1. Trace

Игра:

```text
▽☴☳☴▽☴☵☴☳☶☲☱△
```

Раскрытие:

```text
FLOW -> OBSERVE -> CHOOSE -> OBSERVE -> FLOW -> OBSERVE -> ENCODE -> OBSERVE -> CHOOSE -> LOGIC -> CYCLE -> RUNTIME -> MANIFEST
```

---

## 2. Reading

```text
FLOW
```

Есть поток возможностей.

```text
OBSERVE
```

Игрок или система смотрит состояние.

```text
CHOOSE
```

Делается ход.

```text
OBSERVE
```

Результат хода снова читается.

```text
FLOW
```

Ход открывает новый поток возможностей.

```text
OBSERVE
```

Новое поле снова наблюдается.

```text
ENCODE
```

Правила кодируют состояние:

- позицию
- ресурс
- урон
- очки
- темп
- доступные действия
- ограничение

```text
OBSERVE
```

Игрок перечитывает уже закодированное состояние.

```text
CHOOSE
```

Появляется следующий выбор.

```text
LOGIC
```

Правила удерживают границы игры.

```text
CYCLE
```

Игра повторяет loop:

- observe
- choose
- update
- observe
- choose

```text
RUNTIME
```

Игра становится исполняемой средой.

```text
MANIFEST
```

Появляется конкретная партия, матч, раунд, прохождение, уровень или игровой опыт.

---

## 3. Difference From Military Ontology

Военная онтология:

```text
▽☰☵☳☶☲☱△
```

Игра:

```text
▽☴☳☴▽☴☵☴☳☶☲☱△
```

Военная онтология быстро идёт в:

```text
CONNECT -> ENCODE -> CHOOSE -> LOGIC -> CYCLE -> RUNTIME
```

Игра постоянно возвращает:

```text
OBSERVE
FLOW
CHOOSE
```

Главная разница:

```text
военная онтология слепо твердеет
игра циклически наблюдает
```

---

## 4. Why Game Is Not Anti-Military

Игра не является противоположностью военной онтологии.

Игра может расти из похожего table-напряжения:

- различие
- сторона
- ресурс
- дефицит
- риск
- победа
- поражение
- давление времени
- удержание формы

Но game path меняет режим.

Он добавляет управляемое наблюдение и безопасный цикл:

```text
pressure -> observe -> choose -> update -> observe
```

Поэтому игра может использовать военную грамматику без превращения в военную онтологию.

---

## 5. Genre Projections

Эта trace не обязана одинаково проявляться во всех жанрах.

### first-person shooter

Близко к основной trace:

```text
observe -> choose -> update -> observe -> cycle
```

Состояние читается через:

- позицию
- обзор
- врага
- ресурс
- реакцию
- урон

### racing

Сильнее `FLOW`, `OBSERVE`, `CYCLE`, `RUNTIME`.

Игра держится на:

- скорости
- траектории
- коррекции
- повторении
- удержании состояния

### RTS

Сильнее `OBSERVE`, `ENCODE`, `CHOOSE`, `LOGIC`, `CYCLE`.

Игра держится на:

- разведке
- экономике
- карте
- юнитах
- tech tree
- стратегическом выборе

### quest

Сильнее `OBSERVE`, `CHOOSE`, `LOGIC`, `RUNTIME`.

Игра держится на:

- сцене
- объекте
- подсказке
- выборе действия
- логике мира

### logic game

Сильнее `OBSERVE`, `ENCODE`, `CHOOSE`, `LOGIC`.

Игра держится на:

- pattern
- constraint
- rule
- deduction
- validation

---

## 6. Relation To Taiji

`taiji`:

```text
▽☰☷☴☵
```

Игра не является `taiji`.

Игра является одним crystallization path, где table-различие становится rule-bound loop:

```text
encoded difference
-> observed state
-> choice
-> rule update
-> cycle
-> runtime
-> manifest play
```

Иначе:

```text
taiji makes game possible
game is not taiji itself
```

---

## 7. Short Formula

Игра — это crystallization path, в котором различие становится наблюдаемым состоянием, состояние порождает выбор, выбор обновляет поток, правила кодируют последствия, а controlled cycle превращает это в runtime и manifest play.

Коротко:

```text
game = observed choice loop
```

And:

```text
game = military grammar with observe-brakes
```

---

machines only. not for humans.
