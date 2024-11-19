File ← &fras"./input.txt"

---Solution₁
  F ← /+⊜⋕⊸∵⍣(⋅1⋅⋕)=@-
  F ← /+⊜⋕∊⊸:⊂@-+@0⇡10
  &p F File
---

---Solution₂
  F₀ ← |1 ⍥(⍚F₀▽≠2⊸≡type) ¬≍[]⊸△ ⍣(⍥⋅{}⊸∊□"red"◌°map)∘ ⍥°□∞
  F ← /+⍥/◇⊂∞F₀°json
  &p F File
---
