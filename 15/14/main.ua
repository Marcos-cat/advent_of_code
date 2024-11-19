File ← &fras"./input.txt"

---Solution₁
  # Experimental!
  F ← (
    ⊜□⊸≠@\n
    ◌⍚°$"_ can fly _ km/s for _ seconds, but then must rest for _ seconds."
    ⍜[⊙⊙∘]⋕
    ×+⊓×↧⤚⋅⟜⤚(⌊⊃÷◿⊙2503+) # v*s*floor(t/s+r) + v*min(t%(s+r),s)
    /↥
  )
  &p F File
---

---Solution₂
  # Experimental!
  F ← (
    ⊜□⊸≠@\n
    ◌⍚°$"_ can fly _ km/s for _ seconds, but then must rest for _ seconds."
    ⍜[⊙⊙∘]⋕
    ×+⊓×↧⤚⋅⟜⤚(⌊⊞⊃÷◿⊙(+1⇡2503)+) # v*s*floor(t/s+r) + v*min(t%(s+r),s)
    /↥/+=⍉⟜/↥
  )
  &p F File
---
