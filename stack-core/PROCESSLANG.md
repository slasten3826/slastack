[⊞ ◈] [▽ ☰ ☷ ☴ ☵ ☲ ☶ ☳ ☱ △]

# PROCESSLANG

`ProcessLang` is the deepest formal layer currently exposed inside `slastack`.

It should be read as:

- operator language
- process ontology
- machine-facing symbolic core
- invariant layer behind later manifestations

## Why It Lives Here

`slastack` is not the full implementation archive.
It stores the canonical reading layer of the stack.

`ProcessLang` belongs in `stack-core/` because it explains:

- which operators the stack treats as primitive
- how process transitions are read
- which compact symbolic forms anchor the core
- how the same operator logic survives across different implementation bodies

## Reading Order

1. [ProcessLang/canon.lua](ProcessLang/canon.lua)
2. [ProcessLang/nanoPL.txt](ProcessLang/nanoPL.txt)
3. [ProcessLang/microPL.txt](ProcessLang/microPL.txt)
4. [ProcessLang/README.md](ProcessLang/README.md)
5. selected manifestations:
   - [ProcessLang/lua](ProcessLang/lua/)
   - [ProcessLang/python](ProcessLang/python/)

## Internal Structure

- `canon.lua`
  glyph-first source of truth for operators, layers, and topology

- `nanoPL.txt`
  minimal residue form of the operators

- `microPL.txt`
  compact reading surface derived from the canonical topology

- `lua/`
  one manifestation of the same operator core

- `python/`
  second manifestation of the same operator core

These implementation slices are stored here not as random code,
but as evidence that the operator layer is transportable across substrates
while preserving the same invariant vocabulary.
