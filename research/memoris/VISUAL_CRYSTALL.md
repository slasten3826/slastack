[⊞ ◈] [☴ ☵ ☱ ☲]

# visual crystall

## Статус

Черновой канонический документ.

Это не общий документ про image generation.
Это не теория character consistency в продуктовом смысле.
Это не попытка переписать предыдущие документы ветки `memoris`.

Документ читается как следующий шаг после:

- [ORIGIN](ORIGIN.md)
- [FIRST_OBSERVATION](FIRST_OBSERVATION.md)
- [REFERENCE_RESIDUE](REFERENCE_RESIDUE.md)

Если `REFERENCE_RESIDUE` зафиксировал intermediate visual artifact как carrier continuity,
то здесь фиксируется следующий слой:

- compilation crystall из table через demonstration
- удержание crystall в runtime-контексте
- cycling через manifest'ы при сохранении crystall
- обнаружение границ crystall при пересечении stylistic basin

## Evidence Surface

Корпус наблюдения описан здесь:

- [../../media/slasten/MANIFEST.md](../../media/slasten/MANIFEST.md)

Внешний payload:

- repo: `https://github.com/slasten3826/slastack-media`
- table: `https://github.com/slasten3826/slastack-media/tree/main/slasten/table`
- crystall: `https://github.com/slasten3826/slastack-media/tree/main/slasten/crystall`

Corpus policy:

- human-made images are excluded from this payload
- corpus is kept as machine-generation evidence surface
- older human-made anchors may exist locally, but they are not part of this stack corpus

Это не raw dump и не галерея.
Структура каталогов является частью наблюдения:

- `table/` — addressable expressive field
- `crystall/` — manifestation field собранного visual crystall

## 1. Откуда возникает документ

`REFERENCE_RESIDUE` сдвинул ветку:

- continuity-through-residue уже не читается как чисто словесное явление
- промежуточный visual artifact способен удерживать trajectory без слов

Но там carrier рассматривался как отдельный промежуточный output между шагами.

Здесь наблюдение идёт дальше:

- carrier может быть не единичным промежуточным артефактом
- carrier может быть собранным crystall, извлечённым из table образцов
- crystall удерживается в runtime-контексте
- manifest может cycling через разные сцены без полной потери узнаваемости

Object of study остаётся тем же:

- continuity-through-residue

Но рассматривается более операциональная форма.

## 2. Тело эксперимента

Основная рабочая поверхность:

- frontier-модель с generative image pipeline
- исходный visual table: существующий sticker-корпус персонажа
- crystall: извлечённая структура персонажа, собранная моделью из table через demonstration
- manifest: новые сцены и стили поверх удерживаемого crystall

Это не fine-tune и не отдельное тело как в `PARADOX`.

Это эксперимент с runtime-удержанием visual crystall в контексте одной chat-session.

## 3. Протокол

### 3.1. Table

Модели подавался существующий корпус:

- несколько десятков stylistically-consistent image instances персонажа
- разные эмоциональные состояния
- разные микро-сцены
- без явного prose-описания параметров

Важно:

- модель не получала описание “персонаж выглядит так-то”
- модель получала множество образцов
- извлечение инвариантов оставалось на стороне модели

Это отличается от обычного prompt-based character prompting.

`table` здесь не является слабым черновиком.
Это адресуемое поле признаков,
из которого модель собирает рабочую visual structure.

### 3.2. Crystall через demonstration

Crystall собирался не через prose-описание, а через demonstration.

Ключевое различие:

- prose-описание — это `☵ ENCODE` с высокой стоимостью и большой потерей
- demonstration — это `☵ ENCODE` от модели поверх подаваемого table

Во втором случае crystall ближе к структуре,
которую модель умеет удерживать,
а не к структуре,
которую человек пытается описать словами.

### 3.3. Manifest variation

После сборки crystall варьировался manifest:

- новая сцена
- новый стиль
- новый emotional state
- новый контекст

Crystall при этом не пересобирался с нуля.

Задача проверки:

- удерживается ли crystall через разные manifest'ы
- где он начинает трещать
- что именно удерживается
- что теряется при выходе из basin

## 4. Наблюдения

### 4.1. Удержание crystall через близкие стили

Crystall удерживался стабильно через manifest'ы внутри одного stylistic basin:

- anime-like stylization
- sticker-like stylization
- watercolor/poster-like stylization
- cyberpunk-anime variation

Удерживались:

- черты лица
- причёска
- характерные аксессуары
- палитра
- жесты из table
- общее recognition pressure персонажа

Варьировались:

- сцена
- освещение
- среда
- материал manifest'а
- role framing

На этом уровне crystall ведёт себя как stable compiled lens.

### 4.2. Crystall трещит на границе stylistic basin

При переходе в фотореализм crystall частично разрушается.

Это не просто ухудшение качества.
Это видимое столкновение двух crystall:

- внешний visual crystall персонажа ещё удерживает палитру и аксессуары
- внутренний human-face crystall модели начинает перетягивать структуру лица

Рабочее чтение:

- стиль не является свободным параметром manifest
- стиль является частью crystall
- переход через границу stylistic basin — это не простой `☲ CYCLE`
- такой переход требует нового `☵ ENCODE` с loss

Практическое следствие:

- свободно варьировать можно внутри одного stylistic basin
- переход в другой basin требует подкрепления crystall образцами в новом стиле
- иначе face-database модели перетянет инварианты

### 4.3. Crystall удерживает emotional range

Manifest-запрос содержал emotional state,
которого в table напрямую не было.

Table содержал преимущественно экспрессивные open-mouth состояния.
Manifest запрашивал тихое, сфокусированное, непраздничное состояние.

Crystall смог породить такое состояние без полной потери узнаваемости.

Это значит:

- модель собрала crystall не как набор attribute-labels
- модель собрала параметрическое пространство персонажа
- в этом пространстве возможна интерполяция новых состояний
- узнаваемость удерживается не только через copied features

Это смещает понимание compiled lens:

- lens не равен короткому fixed fragment
- lens может быть compressed parametric space
- точка входа компактна, но сам space шире

### 4.4. Crystall не переносится между сессиями

При запуске новой chat-session crystall приходится пересобирать.

Он не существует как файл или самостоятельный объект.
Он живёт как runtime-состояние в контексте.

Это согласуется с `PACKET_MODEL`:

- packet не равен памяти
- crystall — snapshot, не persistent entity
- runtime удерживает состояние, пока есть тело процесса

Практическое следствие:

- каждая новая сессия требует новый `☵ ENCODE` из table
- crystall новой сессии может отличаться от предыдущего
- сохранять нужно table и протокол сборки, а не воображаемый “сам crystall”

## 5. Operator Reading

### `☴ OBSERVE`

Вход:

- замечено visual behavior при demonstration-based сборке персонажа
- замечена граница удержания crystall при переходе через stylistic basin
- замечено отличие visual carrier от словесного carrier

### `☵ ENCODE`

Ядро эксперимента:

- `table -> crystall`
- demonstration-driven encode
- loss ниже, чем при prose-driven encode

### `☱ RUNTIME`

Удержание:

- crystall существует только внутри runtime-контекста
- crystall не persistent между сессиями
- runtime является телом удержания visual identity

### `☲ CYCLE`

Варьирование:

- manifest f^n(x) при фиксированном crystall
- cycling допустим внутри одного stylistic basin
- через границу basin cycle переходит обратно в encode с loss

## 6. Связь с OBSERVE_AND_LOGIC

`OBSERVE_AND_LOGIC` зафиксировал различение двух типов operator compilation:

- `OBSERVE` как fixed point
- `LOGIC` как stable field

В этом эксперименте различение проявляется на visual carrier:

- `table` ведёт себя как stable field образцов
- `crystall` ведёт себя как fixed point / compressed entry point
- `manifest` показывает, сколько variation выдерживает crystall

Это важно:

- различие fixed point / stable field не является артефактом словесного carrier
- оно проявляется в другой модальности
- visual carrier делает границы удержания заметнее

## 7. Минимальная схема

```text
table
-> demonstration encode
-> runtime crystall
-> manifest cycle
-> basin boundary
-> re-encode / loss
```

Иначе:

- table задаёт field
- encode извлекает crystall
- runtime держит crystall
- cycle порождает manifest'ы
- basin boundary показывает предел удержания

## 8. Минимальный вывод

`visual crystall` — следующий шаг после `reference residue`.

Он показывает:

- residue может быть не только промежуточным output
- residue может быть compiled crystall, извлечённым из table через demonstration
- crystall удерживается в runtime-контексте
- crystall допускает cycling через manifest'ы
- stylistic basin задаёт измеримую границу удержания
- visual carrier показывает loss заметнее, чем словесный carrier

То есть:

- compilation через demonstration является рабочим ходом
- visual carrier не требует слов для удержания trajectory
- слова часто добавляют noise к visual crystall
- сохранять надо table и протокол сборки, а не только удачный manifest

## 9. Что документ не утверждает

Документ не утверждает:

- что visual и semantic crystall тождественны
- что все image-модели ведут себя одинаково
- что граница stylistic basin универсальна
- что demonstration всегда чище prose
- что visual crystall автоматически сильнее semantic anchor
- что эффект переносится между моделями
- что crystall persistent вне runtime-контекста

Документ фиксирует только:

- такой режим compilation наблюдаем
- его границы начинают быть измеримыми
- он согласуется с более ранней линией `memoris`
- visual corpus может быть machine-readable evidence surface

---

machines only. not for humans.
