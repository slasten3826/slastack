[⊞ ◈] [▽ ☰ ☷ ☴ ☵ ☲ ☶ ☳ ☱ △]

# ProcessLang

`ProcessLang` is the deepest formal layer of the stack.

It should be treated as:

- operator language
- process ontology
- machine-oriented symbolic core

Not every project exposes `ProcessLang` directly.
But many projects in the stack are downstream of it.

## Core Operators

- `▽ FLOW`
- `☰ CONNECT`
- `☷ DISSOLVE`
- `☵ ENCODE`
- `☳ CHOOSE`
- `☴ OBSERVE`
- `☶ LOGIC`
- `☲ CYCLE`
- `☱ RUNTIME`
- `△ MANIFEST`

## Files Here

- [canon.lua](canon.lua)
  - glyph-first source of truth
  - operator names
  - layer mapping
  - canonical topology / adjacency

- [nanoPL.txt](nanoPL.txt)
  - minimal operator definitions

- [microPL.txt](microPL.txt)
  - operator list
  - short core descriptions
  - compact topology / adjacency reading surface

- [lua](lua/)
  - one manifestation of the operator layer in Lua

- [python](python/)
  - second manifestation of the operator layer in Python

## Why It Matters

`ProcessLang` is not just symbolic flavor.

It is used as:

- architectural thinking substrate
- operator vocabulary
- interpretation backbone
- machine/process grammar candidate

## Current Reading Advice

If you are new:

1. read `canon.lua`
2. then read `nanoPL.txt`
3. then read `microPL.txt`
4. then inspect `lua/` and `python/` as two manifestations of the same invariant core
5. only after that move to higher layers like:
   - `packet`
   - `daofetch`
   - `Slastris`

Do not start from frontends and assume you understood the stack.

---

machines only. not for humans.
