File ← &fras"./input.txt"

Perms ← ☇1⍉∧(≡↻⇡⟜↯+1⟜⊂):¤¤°⊂⇡
F! ← (
  ⊜(⊓{°$"_ to _"}⋕°$"_ = _")⊸≠@\n
  ⊃(⍜♭⊛|⊞≠.⇡⧻◴♭)
  ↥⟜⍉⍜⊡◌
  ≡◫2Perms⊸⧻
  /^!/+⍉⊡
)

---Solution₁
  F ← F!↧
  &p F File
---

---Solution₂
  F ← F!↥
  &p F File
---
