Input ← &fras"input.txt"
Lines! ← ⊜^!≠@\n.
ParseStacks ← ⍚(⇌▽≠@ .↘1)▽≠@ ⊢⟜⍉⇌Lines!∘
---
ParseMoves ← -1▽Lines!(∩⋕⊙{⊙∘}°$"move _ from _ to _")
Parse ← ⊓ParseMoves ParseStacks:°$"_\n\n_"
Move ← ⍜(°{⊙∘}⊏|⊙⊂:°⊂)
SolutionI ← ≡◇⊢ ∧Move Parse Input
SolutionI
---
---
ParseMoves ← ⊙(-1)Lines!(∩⋕⊙{⊙∘}°$"move _ from _ to _")
Parse ← ⊓ParseMoves ParseStacks:°$"_\n\n_"
Move ← ⍜⊙(°{⊙∘}⊏)(⊙⊂⊃↘↙)
SolutionII ← ≡◇⊢ ∧Move Parse Input
SolutionII
---
