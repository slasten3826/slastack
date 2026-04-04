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

- [nanoPL.txt](nanoPL.txt)
  - minimal operator definitions

- [microPL.txt](microPL.txt)
  - operator list
  - short core descriptions
  - topology / adjacency sketch

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

1. read `nanoPL.txt`
2. then read `microPL.txt`
3. then inspect `lua/` and `python/` as two manifestations of the same invariant core
4. only after that move to higher layers like:
   - `packet`
   - `daofetch`
   - `Slastris`

Do not start from frontends and assume you understood the stack.
