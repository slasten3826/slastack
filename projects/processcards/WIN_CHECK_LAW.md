[⊞ ◈] [☳ ☶ △]

# WIN CHECK LAW

## 0. Status

Canonical victory draft.

This document fixes the current candidate
for how victory is compiled and checked
through `target zone` and `manifest chain`.

It does not yet lock the full derivation grammar
for every possible target trio,
but it does lock the structure of the law.

---

## 1. Core Claim

Victory is not a separate score track.

Victory is compiled from:

- `target zone`
- directed `manifest chain`

Short formula:

```text
target trumps compile the required pattern
manifest chain must become that pattern
```

---

## 2. Compiler Activation

`target zone` is the victory compiler.

When it contains `3` installed trumps,
the current win condition exists.

Before that:

```text
no victory check
```

Short formula:

```text
3 target trumps -> victory pattern exists
fewer than 3 -> no victory check
```

---

## 3. What The Compiler Produces

Each trump in `target zone`
contributes one path-glyph edge.

Because each minor card has:

- one directed upper pair
- one directed lower pair

and cards are not reversible,

```text
AB != BA
```

the target trio does not ask for `3` cards.

It compiles:

```text
one directed 6-slot pattern pair
```

Meaning:

- one full upper reading candidate
- one full lower reading candidate

---

## 4. Reading Law

The compiled pattern may be read in exactly two ways:

- full upper reading
- full lower reading

Mixed reading is illegal.

That means:

- all six checks use upper path positions
- or all six checks use lower path positions
- zig-zag or hybrid reading is forbidden

Short formula:

```text
upper-only or lower-only
never mixed
```

---

## 5. Directed Order Law

Victory is directional.

It is not enough that the right cards exist somewhere in chain.

They must appear:

- in the correct order
- in the correct slot sequence
- in one full legal reading orientation

So `manifest chain` is checked
as a directed sentence,
not as an unordered bag of matches.

Short formula:

```text
victory requires ordered manifestation
not unordered presence
```

---

## 6. Manifest Surface Law

Victory occurs only on the visible six-card `manifest chain`.

Not in:

- deck
- hand
- latent row
- hidden future alone

So:

```text
target zone writes destiny
manifest chain must embody it
```

---

## 7. Timing Law

Victory is checked only after:

- `target zone` is fully compiled with `3` installed trumps
- world update for the turn is complete
- the played effect has resolved
- caused queue handling has closed

Victory is checked:

```text
once per turn
after full effect closure
```

This prevents dirty mid-resolution wins.

---

## 8. Why This Is Not Just A Puzzle

The target pattern is fixed enough to be readable,
but the player still reaches it through a moving machine:

- the chain keeps shifting
- hand effects keep rewriting access
- trumps disturb stability
- compiler pressure changes the meaning of the chain

So the win condition is not merely solved.

It is:

```text
a directed dance with the machine
```

---

## 9. Open Layer

This law still does not fully lock:

- exact derivation grammar for every possible target trio
- whether rare trumps may later modify victory checking
- whether special alternative win-laws may appear

But it does lock the current core:

```text
3 target trumps compile
1 directed 6-slot pattern pair exists
manifest must match one full reading
victory is checked after full effect closure
```

---

## 10. Final Short Formula

```text
3 target trumps in target zone compile a directed 6-slot victory pattern pair.
The visible manifest chain must match one full upper or one full lower reading in order.
Victory is checked once per turn after full effect closure.
```

---

machines only. not for humans.
