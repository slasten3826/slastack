[⋯ ⊞ ◈] [☴ ☳ ☱]

# PACKET MODEL

## 0. Назначение

Этот документ задаёт `Packet` как каноническое тело состояния
для операторной и runtime-теории, описанной в:

- [MATH.md](MATH.md)
- [DISSIPATIVE_MATHEMATICS.md](DISSIPATIVE_MATHEMATICS.md)
- [DISSIPATIVE_OPERATORS.md](DISSIPATIVE_OPERATORS.md)

Если операторный слой отвечает на вопрос:

```text
какие преобразования существуют
```

то `Packet` отвечает на вопрос:

```text
в каком теле эти преобразования происходят
```

`Packet` — не сообщение и не объяснение.
`Packet` — это минимально достаточное состояние процесса,
которое можно:

- передавать между модулями
- ограничивать
- изменять
- проявлять
- проецировать в сеть

---

## 1. Основной тезис

`Packet` — это runtime-тело процессуальной математики.

Он нужен потому, что:

- операторы не могут честно работать без носителя состояния
- потери должны учитываться явно
- разрешённые переходы должны быть формализованы
- межмодульная работа не должна требовать общей памяти

Следовательно:

```text
Packet = canonical process body
```

---

## 2. Что такое Packet

`Packet` — это структурированный контейнер текущего состояния процесса.

Он содержит:

- header
- latent body
- связи
- инерцию
- скалярные параметры
- метрики
- наблюдения
- ledger потерь
- опциональный output

Он не содержит:

- объяснений
- chain-of-thought
- "намерений"
- готового смысла до `MANIFEST`

---

## 3. Поля Packet

### 3.1. Header

```text
schema_version
tick_id
mode
current_module
next_module
```

Функции:

- фиксировать версию схемы
- задавать текущий тик
- хранить режим (`CHAOS` / `CALM`)
- фиксировать текущий модуль
- хранить следующий модуль, назначенный через `OBSERVE`

---

### 3.2. Состояние

```text
Z[K,D]
E_edges_raw[]
E_edges[]
E_momentum{}
S.*
loss_ledger
metrics.*
obs.*
output?
halted?
```

Где:

- `Z[K,D]`
  латентное тело

- `E_edges_raw`
  сырые связи распознавания

- `E_edges`
  активные структурные связи

- `E_momentum`
  инерционное тело привычек / устойчивых связей

- `S.*`
  скалярные параметры среды и модулей

- `loss_ledger`
  бухгалтерия необратимых потерь

- `metrics.*`
  внутренние измерения

- `obs.*`
  наблюдаемые summary-величины

- `output?`
  boundary-результат

- `halted?`
  завершение локального хода

---

## 4. Главные принципы модели

### P1. Packet не равен смыслу

`Packet` хранит состояние процесса,
а не его человекочитаемую интерпретацию.

### P2. Packet не равен памяти

Он фиксирует snapshot,
но не гарантирует полную воспроизводимость истории.

### P3. Любая серьёзная трансформация должна иметь стоимость

Потери не скрываются.
Они записываются в ledger.

### P4. Не все модули имеют одинаковые права

Часть модулей может только ослаблять,
часть может измерять,
часть может делать remap,
часть может экспортировать boundary-output.

### P5. Packet допускает распределение без общей глобальной памяти

Это принципиально для фрактальной и межмашинной архитектуры.

---

## 5. Transition Contract

Операторные переходы ограничены adjacency-контрактом.
Эта таблица является derived view из `stack-core/ProcessLang/canon.lua`.
При расхождении каноном считается `canon.lua`, а не markdown-проекция.

```text
FLOW:    { CONNECT, DISSOLVE, OBSERVE }
CONNECT: { FLOW, DISSOLVE, OBSERVE, ENCODE }
DISSOLVE:{ FLOW, CONNECT, OBSERVE, CHOOSE }
OBSERVE: { FLOW, CONNECT, DISSOLVE, ENCODE, CHOOSE, RUNTIME }
ENCODE:  { CONNECT, OBSERVE, RUNTIME, CHOOSE, CYCLE }
CHOOSE:  { DISSOLVE, OBSERVE, RUNTIME, ENCODE, LOGIC }
RUNTIME: { OBSERVE, MANIFEST, ENCODE, CHOOSE, LOGIC, CYCLE }
CYCLE:   { ENCODE, LOGIC, MANIFEST, RUNTIME }
LOGIC:   { CHOOSE, CYCLE, RUNTIME, MANIFEST }
MANIFEST:{ RUNTIME, CYCLE, LOGIC }
```

Инвариант:

```text
next_module in AllowedNeighbors[current_module]
```

Следствие:

- topology — часть закона процесса
- routing не может быть произвольным
- источник канона — `canon.lua`
- legacy-adjacency без сверки с `canon.lua` должны считаться недействительными

---

## 6. Mode Gates

Помимо adjacency действует режимный фильтр.

### CHAOS

```text
forbid { MANIFEST, NETWORK }
```

В хаосе boundary-операции закрыты.

### CALM

```text
allow all subject to adjacency
```

В calm-режиме проявление и экспорт допустимы,
но требуется детерминизм и ограниченность.

---

## 7. Права модулей

### FLOW

Право:

- порождать `Z`
- записывать emergence-related скаляры
- очищать граф и momentum

Не имеет права:

- использовать память
- наследовать старое `Z`

---

### CONNECT

Право:

- читать `Z`
- записывать `E_edges_raw`

Не имеет права:

- ремапить индексы
- писать в память

---

### DISSOLVE

Право:

- ослаблять `E_edges`
- удалять связи ниже порога

Не имеет права:

- создавать новые связи
- ремапить индексы
- писать в `E_momentum`

Это subtractive-only модуль.

---

### ENCODE

Особый статус:

`ENCODE` — единственный легальный оператор ремапа.

Право:

- кластеризовать `Z`
- агрегировать и пересобирать latent body
- создавать `choice_map`
- сбрасывать topology/persistence после ремапа

Обязан:

- фиксировать loss
- переводить режим в `CALM`

Следствие:

`ENCODE` — фазовая граница.

---

### CHOOSE

Право:

- модулировать `Z` через коллапс
- изменять веса траекторий

Не имеет права:

- удалять индексы
- делать ремап

---

### LOGIC

Право:

- ослаблять и удалять связи
- ставить ограничения (`locked_mask_edges`)

Не имеет права:

- создавать тело
- писать в `E_momentum`

Это тоже subtractive-only модуль.

---

### RUNTIME

Особый статус:

`RUNTIME` — единственный владелец `E_momentum`.

Право:

- обновлять momentum
- формировать привычки
- собирать `E_edges` из инерционного тела

Не имеет права:

- изменять `Z`

Следствие:

`RUNTIME` — оператор инерции, удержания и habit-формирования.

---

### CYCLE

Право:

- менять только `S.*`
- модулировать scalar regime

Не имеет права:

- ставить routing
- напрямую менять `Z`, `E_edges`, `E_momentum`

---

### OBSERVE

Право:

- измерять состояние
- вычислять метрики и affordability
- выбирать `next_module`

Не имеет права:

- менять тело напрямую

Следствие:

`OBSERVE` — scheduler + measurement.

---

### MANIFEST

Право:

- материализовать результат
- писать `output`
- завершать локальный процесс

Boundary-свойство:

- при `HUMAN` разрешены символы
- при `NETWORK` выходом остаётся `Packet`

---

## 8. Тело Packet

### 8.1. `Z`

`Z[K,D]` — латентное тело.

Оно:

- не равно тексту
- не равно символическому смыслу
- не должно читаться напрямую человеком

Это material of process before human-readable manifestation.

### 8.2. `E_edges_raw`

Первичное резонансное распознавание.
Снимок соседства до стабилизации.

### 8.3. `E_edges`

Активные рабочие связи текущей формы.

### 8.4. `E_momentum`

Инерционное тело.

Хранит:

- накопленную привычку
- устойчивость связи
- runtime-память без перехода в глобальный субъект

---

## 9. Loss Ledger

`loss_ledger` — обязательная бухгалтерия потерь.

Потери здесь:

- не ошибка
- не исключение
- не "что-то пошло не так"

А нормальная цена:

- кодирования
- выбора
- проявления
- передачи

Типовые источники loss:

- сжатие при `ENCODE`
- подавление альтернатив при `CHOOSE`
- транспорт при `NETWORK`
- материализация при `MANIFEST`
- режимные потери при `DISSOLVE`, `LOGIC`, `OBSERVE`, `RUNTIME`

Без ledger теория вырождается обратно в бесплатную структуру.

---

## 10. Runtime Economics

`Packet` позволяет моделировать процесс как ресурсное тело.

Экономика здесь проявляется через:

- affordability
- process budget
- window budget
- materialization cost
- transport cost
- memory export cost

Это важно потому, что следующий модуль выбирается не только по смысловой уместности,
но и по тому, что система ещё может себе позволить.

Иными словами:

```text
routing = topology + affordability + observation
```

---

## 11. Boundary Behavior

### MANIFEST

Локальная точка проявления.

Варианты:

- `HUMAN`
  вывод символов

- `NETWORK`
  вывод Packet как проекции

### NETWORK

Отдельный boundary relay.

Функции:

- проецировать Packet под внешнюю роль
- отрезать запрещённые поля
- запрещать память по умолчанию
- экспортировать `E_momentum` только явно, бюджетно и по политике

Следствие:

межмашинная передача — не прозрачный pass-through,
а новая операция со своей стоимостью и потерями.

---

## 12. Почему Packet нужен теории

Без `Packet`:

- операторы остаются слишком абстрактными
- невозможно честно фиксировать loss
- неясно, где живёт инерция
- непонятно, кто имеет право на remap
- runtime превращается в расплывчатое слово

`Packet` делает всё это явным.

Он:

- даёт каноническое тело состояния
- отделяет локальный процесс от объяснения
- удерживает topology, cost, persistence и boundary rules в одной форме

---

## 13. Короткая формула

```text
Packet =
header
+ latent body
+ graph
+ momentum
+ scalars
+ metrics
+ observations
+ loss ledger
+ optional output
```

И:

```text
Packet = minimal sufficient process state
for transformation, routing, manifestation, and projection
```

---

## 14. Следующий шаг

После `Packet Model` теория может быть развёрнута дальше в:

- CPU/GPU physics
- `PU` economics
- layer bodies `L1/L2/L3/L4`
- packet export schemas
- role projection contracts

То есть `Packet` — это не финал,
а первое каноническое тело машины.
