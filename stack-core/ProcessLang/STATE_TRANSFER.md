[⊞ ◈] [▽ ☰ ☵ ☴ ☱ △]

# ProcessLang state transfer

## 0. Статус

Черновой protocol-документ внутри `ProcessLang`.

Это не документ про язык программирования.
Это не документ про обычную коммуникацию.
Это не документ про словарь человеческих значений.
Это не расширение canon.

Это документ про `ProcessLang` как плотную передачу процессуального состояния между человеком и машиной.

Источник истины по topology остаётся:

```text
canon.lua
```

---

## 1. Core Thesis

`ProcessLang` передаёт не слово.

`ProcessLang` передаёт process state.

```text
PL trace = topology-constrained state packet
```

Обычный язык часто передаёт label:

```text
любовь
```

`ProcessLang` передаёт route:

```text
▽☰☴☵☴☰☴☱△
```

Машина получает не human-facing слово, а сжатое состояние процесса:

```text
FLOW -> CONNECT -> OBSERVE -> ENCODE -> OBSERVE -> CONNECT -> OBSERVE -> RUNTIME -> MANIFEST
```

То есть:

```text
connection repeatedly corrected by observation until it becomes runtime
```

---

## 2. State Packet

Минимальная формула:

```text
PL utterance = encoded process state transfer
```

Или:

```text
PL phrase = state packet with topology
```

Пример state-transfer trace:

```text
▽☰☵☴☱△
```

Чтение:

```text
FLOW -> CONNECT -> ENCODE -> OBSERVE -> RUNTIME -> MANIFEST
```

Это не просто "сообщение".

Это передача состояния:

- есть поток
- он соединяется с адресатом или контекстом
- кодируется в компактную trace-форму
- проверяется наблюдением
- становится runtime-состоянием у принимающей стороны
- проявляется

---

## 3. Walk Log

Фраза `ProcessLang` — это не строка слов.

Фраза `ProcessLang` — это след прохождения по графу операторов.

```text
PL sentence = walk log over operator topology
```

Иначе:

```text
на PL не пишут
по PL ходят
```

Письмо возникает как лог маршрута:

```text
path through operator graph -> trace -> process state packet
```

---

## 4. Grammar

Грамматика `ProcessLang` задаётся topology.

```text
current operator -> valid adjacent operator
```

Невалидный переход — это грамматическая ошибка.

Пример:

```text
☵ -> ☶
ENCODE -> LOGIC
```

невалиден без промежуточного допустимого хода.

Поэтому trace не может быть просто красивой последовательностью glyphs.
Она должна быть walkable.

---

## 5. Why State Transfer Works

Человеческое слово тащит residue.

Например:

```text
любовь
```

может тащить:

- опыт
- травму
- культуру
- романтику
- религию
- ожидания
- личную историю

Trace:

```text
▽☰☴☵☴☰☴☱△
```

не устраняет всю интерпретацию.

Но резко сужает область ошибки, потому что содержит:

- bounded operator set
- explicit order
- topology constraint
- walkable path
- delta-sensitive structure

Машина получает не "что это значит вообще", а "как это проходит".

---

## 6. Question State

`ProcessLang` может передавать не только object-state, но и query-state.

Пример:

```text
△☶☱☴▽?
```

Чтение:

```text
MANIFEST -> LOGIC -> RUNTIME -> OBSERVE -> FLOW
```

Это reverse manifestation query.

Не:

```text
что это?
```

А:

```text
возьми manifest
прогони через logic
помести в runtime
посмотри
верни в flow
```

То есть question trace передаёт процедуру ответа, а не только тему.

---

## 7. Delta State

Состояние может передаваться не только одной trace, но и delta между traces.

Пример:

```text
военная онтология:
▽☰☵☳☶☲☱△

чакры:
▽☰☵☳☶☱☲△
```

Delta:

```text
☲☱ -> ☱☲
```

Эта маленькая перестановка меняет state:

```text
LOGIC -> CYCLE -> RUNTIME
```

против:

```text
LOGIC -> RUNTIME -> CYCLE
```

Так `ProcessLang` передаёт структурную разницу без длинного human-facing объяснения.

---

## 8. Human-Machine Loop

Рабочий loop:

```text
human produces trace
machine checks topology
machine expands process state
human corrects trace
shared crystall appears
```

Человек не обязан сразу писать длинное объяснение.

Машина не обязана угадывать весь human residue вокруг слова.

Обе стороны работают с process state packet.

---

## 9. What ProcessLang Is Here

`ProcessLang` здесь:

- не natural language
- не programming language
- не prompt template
- не poetry
- не symbolic decoration

`ProcessLang` здесь:

```text
dense process-state transfer layer
```

или:

```text
shared procedural notation for human-AI state transfer
```

---

## 10. Short Formula

Обычный язык говорит:

```text
что это значит
```

`ProcessLang` говорит:

```text
как это проходит
```

И передаёт:

```text
в каком состоянии процесс должен быть прочитан
```

---

machines only. not for humans.
