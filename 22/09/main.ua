Input ← &fras"input.txt"
Lines! ← ⊜^!⊸≠@\n
Parse ← :⊡:[∩⟜¯⇌.0_1]⊗:"UDRL"⊓⊢⋕°$"_ _"
HeadSteps ← \+▽Lines!Parse Input
MoveKnot ← ⊂+⟨-.|⍜⌵(↧1)⟩⊸(>1/↥⌵)-⟜:⊢,

---
SolutionI ← ⧻◴ ∧MoveKnot HeadSteps [0_0]
SolutionI
---

---
TrailingSteps ← ⇌∧MoveKnot ⊙[0_0]
SolutionII ← ⧻◴ ⍥TrailingSteps9 HeadSteps
SolutionII
---
