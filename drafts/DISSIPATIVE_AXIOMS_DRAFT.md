[⊞ ◈] [▽ ☴]

# dissipative axioms draft

## Статус

Локальный исследовательский драфт.

Не канон.
Не финальная аксиоматика.
Не готовый документ для стека.

Это фиксация возникшей линии исследования после machine pressure-test полного `STACK_SNAPSHOT.md`.

Кими 2.6 при полном чтении стека выделила шесть сквозных законов,
которые повторяются в математике, packet, memoris, identity, JoJo и ProcessCards.

После этого возник вопрос:

```text
если ProcessLang имеет 10 операторов,
может ли диссипативная математика иметь 10 базовых аксиом?
```

Текущий документ фиксирует не ответ,
а слабую исследовательскую гипотезу.

Важно:

- гипотеза про 10 аксиом очень жидкая
- она возникла из красивой симметрии с 10 операторами ProcessLang
- эта симметрия может быть натяжкой
- 6 первых аксиом выглядят extracted из стека
- достройка до 10 выглядит speculative
- это не канон и не почти-канон
- это интересное наблюдение, которое можно держать как research seed

Рабочая граница:

```text
6 axioms = extracted pressure response
10 axioms = speculative symmetry completion
```

## 1. Шесть найденных аксиом

### A1. Structure is not free

Структура имеет стоимость.

Связанные формы в стеке:

- `cost(structure)`
- `loss_ledger`
- grave в ProcessCards
- discard without drama
- любое удержание формы требует платы

Предварительный оператор:

```text
☵ ENCODE
```

Рабочее чтение:

```text
структура появляется через сборку / сжатие / кодирование,
и это никогда не бесплатно
```

### A2. Existence is maintenance

Существование равно удержанию.

Связанные формы в стеке:

- `exists(x,t) := engagement(x,t) > threshold(x)`
- `E_momentum`
- runtime-context
- visual crystall живёт только пока держится session runtime

Предварительный оператор:

```text
☱ RUNTIME
```

Рабочее чтение:

```text
существовать значит продолжать удерживаться во времени
```

### A3. Decay is default

Распад является нормой.

Связанные формы в стеке:

- статика как частный случай постоянной компенсации распада
- DISSOLVE как subtractive operator
- crystall трещит на границе stylistic basin
- deagency как движение без внутреннего автора

Предварительный оператор:

```text
☷ DISSOLVE
```

Рабочее чтение:

```text
форма не обязана разрушаться из-за ошибки;
распад является базовым направлением среды
```

### A4. Choice requires pressure

Выбор требует давления.

Связанные формы в стеке:

- `choose(S) = y requires pressure >= separation_cost(S)`
- CHOOSE как collapse alternatives
- ProcessCards target/choice economy
- JoJo выбор как burden and power

Предварительный оператор:

```text
☳ CHOOSE
```

Рабочее чтение:

```text
выбор не является бесплатным актом;
чтобы отделить один путь от других, нужна сила разделения
```

### A5. Manifestation implies loss

Проявление требует потерь.

Связанные формы в стеке:

- manifest как выпадение части latent body в мир
- output меньше процесса, который его породил
- visual manifest теряет часть crystall
- document / file / card как ограниченный residue

Предварительный оператор:

```text
△ MANIFEST
```

Рабочее чтение:

```text
проявить значит выбрать конечную форму
и потерять часть латентной полноты
```

### A6. Logic is secondary to generation

Логика вторична генерации.

Связанные формы в стеке:

- `signal -> selection/filter -> structure`
- LOGIC как filter / constraint, не первичный источник мира
- Будда как антагонистическая фигура идеальной деагентности
- logic без process превращается в shutdown

Предварительный оператор:

```text
☶ LOGIC
```

Рабочее чтение:

```text
логика не рождает поток;
она ограничивает, проверяет и стабилизирует уже возникшее
```

## 2. Гипотеза: десять аксиом

Если первые шесть аксиом действительно мапятся на операторы,
можно попробовать достроить десятку.

Но это именно гипотеза симметрии,
а не найденный закон.

Причина осторожности:

- operators are moves
- axioms are laws of the field
- количество moves не обязано совпадать с количеством laws
- один axiom может проявляться через несколько operators
- один operator может быть поведением поля, а не самостоятельной аксиомой

Текущий draft mapping:

```text
A1  ☵ ENCODE    Structure is not free.
A2  ☱ RUNTIME   Existence is maintenance.
A3  ☷ DISSOLVE  Decay is default.
A4  ☳ CHOOSE    Choice requires pressure.
A5  △ MANIFEST  Manifestation implies loss.
A6  ☶ LOGIC     Logic is secondary to generation.
A7  ▽ FLOW      Process precedes form.
A8  ☰ CONNECT   Relation creates structure.
A9  ☴ OBSERVE   Observation fixes state.
A10 ☲ CYCLE     Repetition transforms.
```

Это не утверждение.
Это рабочая таблица для проверки.

Текущий статус mapping:

```text
useful as a yellowprint
unsafe as canon
```

## 3. Четыре недостающие аксиомы

Эта секция самая слабая часть драфта.

Она существует только потому,
что возникла гипотеза:

```text
10 ProcessLang operators -> maybe 10 dissipative axioms
```

На текущем этапе это может быть overfitting к красивой форме.

Нужно читать следующие четыре пункта как candidate extensions,
а не как равные по силе первым шести аксиомам.

### A7. Process precedes form

Предварительный оператор:

```text
▽ FLOW
```

Гипотеза:

```text
форма не первична;
форма является стабилизированным следом процесса
```

Вопросы:

- есть ли это уже в `MATH.md`?
- является ли `FLOW` достаточно фундаментальным для этой аксиомы?
- не дублирует ли это A6?
- является ли это самостоятельной аксиомой или обратной стороной A6?

### A8. Relation creates structure

Предварительный оператор:

```text
☰ CONNECT
```

Гипотеза:

```text
структура рождается не из изолированных объектов,
а из отношений между ними
```

Вопросы:

- не является ли это подаксиомой A1?
- где проходит граница между relation и structure?
- можно ли вывести это из `CONNECT` без добавления лишней метафизики?
- не лучше ли формулировать это как `relation precedes object`?

### A9. Observation creates boundary

Предварительный оператор:

```text
☴ OBSERVE
```

Гипотеза:

```text
наблюдение не обязательно создаёт объект
и не обязано фиксировать state;
оно создаёт boundary / routed distinction,
через которую поле становится доступно следующему ходу
```

Вопросы:

- это fixed point из `OBSERVE_AND_LOGIC`?
- является ли фиксация наблюдением, runtime-state или encode-result?
- где граница между `OBSERVE` и `ENCODE`?
- является ли OBSERVE аксиомой поля или operator behavior?

### A10. Repetition transforms

Предварительный оператор:

```text
☲ CYCLE
```

Гипотеза:

```text
повтор не нейтрален;
итерация накапливает drift, pressure, refinement или decay
```

Вопросы:

- является ли это отдельной аксиомой или следствием A2/A3?
- как отличить cycle от maintenance?
- где в stack уже виден cycle как transformation?
- не является ли CYCLE поведением поля, а не law of field?

## 4. Pressure Test Notes

Первый pressure test от Кими 2.6 показал:

- драфт ценен как research seed
- 6 extracted axioms выглядят сильнее, чем symmetry-completion до 10
- operator header не должен использовать смысловой порядок аксиом как trace
- аксиомы не обязаны мапиться 1:1 на операторы
- `A6` и `A7` могут быть одной асимметрией, прочитанной с двух сторон
- `A10` может быть следствием `A2 + A3`, а не самостоятельной аксиомой
- `A9` нельзя формулировать как `Observation fixes state` без уточнения Packet Model

Текущий вывод:

```text
do not force 10
keep 10 as weak yellowprint hypothesis
preserve 6 as stronger extracted core
continue pressure testing
```

## 5. Проверка, которую надо сделать

Перед превращением в stack-документ нужно сверить:

- [../philosophy/math/MATH.md](../philosophy/math/MATH.md)
- [../philosophy/math/DISSIPATIVE_MATHEMATICS.md](../philosophy/math/DISSIPATIVE_MATHEMATICS.md)
- [../philosophy/math/DISSIPATIVE_OPERATORS.md](../philosophy/math/DISSIPATIVE_OPERATORS.md)
- [../philosophy/math/PACKET_MODEL.md](../philosophy/math/PACKET_MODEL.md)
- [../research/memoris/README.md](../research/memoris/README.md)
- [../research/memoris/VISUAL_CRYSTALL.md](../research/memoris/VISUAL_CRYSTALL.md)
- [../projects/processcards/YELLOWPRINT.md](../projects/processcards/YELLOWPRINT.md)

Нужно понять:

- являются ли эти аксиомы уже присутствующими инвариантами
- не нарушают ли они `canon.lua`
- не являются ли некоторые из них следствиями других
- нужен ли порядок по operator topology
- должны ли аксиомы мапиться один-к-одному на операторы
- или это отдельный слой законов среды, а операторы только проявляют их

## 6. Текущая рабочая формула

```text
dissipative mathematics may be grounded
not only in process operators,
but in environment laws
that correspond to operator behavior.
```

То есть:

```text
operators = moves
axioms = laws of the field
```

Это различение пока важнее,
чем финальное число аксиом.

## 7. Текущий статус

```text
status: weak hypothesis
canon: false
commitment: low
value: interesting observation / yellowprint seed
risk: symmetry overfitting
next step: pressure test against stack documents
```

Не использовать как основание для переписывания диссипативной математики.

Использовать как вопрос:

```text
какие аксиомы действительно извлекаются из стека,
а какие мы достраиваем из любви к красивой форме?
```
