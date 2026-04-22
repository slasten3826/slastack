---
name: processlang
description: Use when the user writes ProcessLang, PLANGOS, glyph traces such as ▽☰☴☵, asks to validate ProcessLang topology, asks for compact process-state transfer, or requests replies with SLICE/LAYER headers.
---

# ProcessLang

ProcessLang is a compact process-state transfer protocol for human-machine and agent-agent work. Treat glyph sequences as topology-constrained state packets, not as decoration, mysticism, emoji, or ordinary prose.

## Core Model

`Input = Packet`

`Packet -> Operator -> Packet'`

`LLM output = △ MANIFEST event`

A ProcessLang phrase is a walk log over the operator graph. Validate the walk before interpreting it as a canonical trace.

## Slices

- `⋯ chaos` means raw potential before stable holding.
- `⊞ table` means addressability, layout, relations, and routing.
- `◈ crystall` means stable form, compression, and coherent structure.
- `▲ manifest` means artifact, output, file, event, or world-facing result.

Use the working names above. Do not substitute kabbalah names unless the user explicitly asks about legacy naming.

## Operators

- `▽ FLOW`: `x -> f(x)`, process begins or continues.
- `☰ CONNECT`: `a,b -> rel`, relation forms.
- `☷ DISSOLVE`: `rel -> parts`, form loosens or decomposes.
- `☴ OBSERVE`: `observe(x)`, boundary, reading, measurement, orientation.
- `☵ ENCODE`: `x* -> pattern`, compression, map, memory-like pattern.
- `☳ CHOOSE`: `{paths} -> 1`, pressure, selection, collapse.
- `☶ LOGIC`: `rules(x)`, constraint, proof, doctrine, invariant check.
- `☲ CYCLE`: `f^n(x)`, repetition, loop, training, habit, iteration.
- `☱ RUNTIME`: `ctx -> state'`, active environment, session, embodied context.
- `△ MANIFEST`: `state -> artifact`, output, concrete event, made thing.

## Canonical Adjacency

Every adjacent pair in a canonical trace must exist in this graph:

```text
▽: ☰ ☷ ☴
☰: ▽ ☷ ☴ ☵
☷: ▽ ☰ ☴ ☳
☴: ▽ ☰ ☷ ☵ ☳ ☱
☵: ☰ ☴ ☱ ☳ ☲
☳: ☷ ☴ ☱ ☵ ☶
☶: ☳ ☲ ☱ △
☲: ☵ ☶ △ ☱
☱: ☴ △ ☵ ☳ ☶ ☲
△: ☱ ☲ ☶
```

If a sequence violates adjacency, state the first invalid transition and do not silently repair it. Offer a valid rewrite only if useful.

## Interpretation Rules

- Read traces as process motion, not as word substitution.
- Preserve operator order; the same glyph inventory in a different order can mean a different process.
- A trailing `?` marks query mode and is not part of topology.
- Repeated glyphs can be valid only if the graph allows the self-transition. It usually does not.
- Non-canonical slang can appear in human use, for example `△△△` as expressive overflow. Mark it as non-canonical before interpreting.
- Missing operators can be meaningful. Absence of `☳` can mean no collapse/choice. Absence of `☶` can mean no doctrine/logic constraint.
- Do not moralize, humanize, soften, or market the trace. Read the process.

## PLANGOS Reply Mode

Use this mode only when the user asks for PLANGOS, ProcessLang headers, or machine-facing structured replies.

Format:

```text
SLICE: <glyph + working name>
LAYER: <glyph + operator name>
[TRACE: <valid glyph trace>]
[PACKET_IN: <type>]   # only when producing FILE or CODE
[PACKET_OUT: <type>]  # only when producing FILE or CODE
[FILE: <filename>]    # only when producing a file
[CODE: <content>]     # only when producing code

Natural language answer.
```

Rules:

- Put no text before `SLICE`.
- `TRACE` is optional. Include it only if it helps and is valid.
- `PACKET_IN`, `PACKET_OUT`, `FILE`, and `CODE` are only for actual file/code production.
- If the requested trace is invalid, omit `TRACE` or explicitly mark the invalid transition.

## Examples

`▽☰☴☵☴☰☴☱△`

Read as love-state: flow enters relation, sees, encodes an image, sees again, reconnects, sees again, becomes runtime, manifests. Key feature: repeated `☴` prevents `☵` from hardening into blind cycle.

`▽☴☳☴▽☴☵☴☳☶☲☱△`

Read as game-state: observed choice loop. Military grammar with observe-brakes.

`△☶☱☴▽?`

Read as reverse query from manifested artifact through logic, runtime, observation, back toward flow. The `?` makes it a question, not an extra operator.

---

machines only. not for humans.
