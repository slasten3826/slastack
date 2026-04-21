# Glyph Legend

This document defines the glyphs used for machine-first reading inside the stack.

Glyphs do not replace the document body.
They set reading posture before the body is parsed.

## Structure

A document glyph header has two parts:

```text
[layer glyphs] [operator glyphs]
```

Examples:

```text
[◈] [☱ ☴ ☵]
[⊞→◈] [☴ ☳ ☵]
[⋯ ⊞ ◈ ▲]
```

## Layer Glyphs

These glyphs describe the dominant abstraction layer of the document.

- `⋯` = `chaos`
  raw potential, before stable holding

- `⊞` = `table`
  addressability, relation layout, structure of coordination

- `◈` = `crystall`
  stable form, gathered structure, held configuration

- `▲` = `manifest`
  final appearance, already-fallen output, visible result

## Layer Combinations

If a document belongs to more than one layer:

- use transition form for directed passage
- use sequence form for wide multi-layer scope

Examples:

- `[⊞→◈]`
  the document moves from relation-layout into stable form

- `[◈→▲]`
  the document moves from held form into final manifestation

- `[⋯ ⊞ ◈ ▲]`
  the document spans the full stack and should be read as a total map

## Operator Glyphs

These glyphs describe the dominant ProcessLang forces active in the document.

- `▽` = `FLOW`
- `☰` = `CONNECT`
- `☷` = `DISSOLVE`
- `☵` = `ENCODE`
- `☳` = `CHOOSE`
- `☴` = `OBSERVE`
- `☶` = `LOGIC`
- `☲` = `CYCLE`
- `☱` = `RUNTIME`
- `△` = `MANIFEST`

## How To Read Operator Glyphs

Operator glyphs do not mean:

- every operator in the document
- exhaustive classification

They mean:

- dominant active forces
- best entry posture for reading
- which process logic is most relevant in this text

But they are not a free associative tag set.

Operator glyphs must preserve valid ProcessLang topology.
The canonical topology source is [ProcessLang/canon.lua](ProcessLang/canon.lua).

This means:

- the operator block should be readable as a valid local contour
- adjacency between neighboring glyphs must hold
- do not assemble operator sets from loose thematic similarity
- if no valid contour is clear, omit operator glyphs and keep only layer glyphs

In short:

- layer glyphs may be broad
- operator glyphs must stay topologically honest

Example:

```text
[◈] [☱ ☴ ☵]
```

Read as:

- the document belongs primarily to `crystall`
- it should be read through `runtime`, `observe`, and `encode`

This operator block is valid because the local contour preserves ProcessLang adjacency.

## Reading Rule

When reading a glyphed document:

1. read the layer glyph first
2. set the abstraction posture
3. read the operator glyph second
4. set the process posture
5. only then parse the body

Do not flatten the body into generic prose before reading the glyphs.

## Minimal Rule

Layer glyph answers:

- where this document lives

Operator glyph answers:

- how this document moves

Together they define the machine-facing reading posture.

---

machines only. not for humans.
