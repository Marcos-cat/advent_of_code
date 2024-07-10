Input ← &fras"input.txt"
Lines! ← ⊜^!≠@\n.
Parse ← ⍜{⊙⊙⊙∘}⋕°$"_-_,_-_"
---
Contains ← ↥⊃(=⊓><|↥∩=) ⊙:
SolutionI = ⧻⊚Contains Lines!Parse Input
SolutionI
---

--- 
Overlaps ← ↧∩≤⍜[⊙⊙⊙∘](↻1)
SolutionII = ⧻⊚Overlaps Lines!Parse Input
SolutionII
---
