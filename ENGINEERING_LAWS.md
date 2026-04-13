# Engineering Laws

[⊞→◈]

This file describes the engineering style behind the stack.

## Core Values

- architecture before convenience
- invariants before interpretation
- process before surface
- runtime before presentation
- one good abstraction is better than ten patches

## Rules

### Build By Layers

Do not collapse substrate, engine, interpretation, and UI without a strong reason.

### Protect Invariants

Always distinguish what must not change from what may vary.

### Prefer Clean Cores

Small cores, portable cores, replaceable frontends, explicit boundaries.

### Avoid Process Theater

Do not optimize for enterprise fashion, ritual architecture, or cargo cult structure.

### Machines Multiply Structure

Agents and LLMs amplify the architecture they touch.
Weak structure gets weaker.
Strong structure gets stronger.

## Quality Test

A solution is probably good if it:

- sharpens the core
- reduces accidental complexity
- improves portability
- makes later manifestations easier

A solution is probably bad if it:

- mixes layers
- hides mechanism
- adds surface complexity to the core
- makes reuse harder
