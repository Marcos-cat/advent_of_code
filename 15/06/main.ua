File ← &fras"input.txt"

---Solution₁
  F ← (
    ⊜(
      :⍣(0°$"turn on _"|1°$"turn off _"|2°$"toggle _")
      +⋯2⊟∩[∩⋕°$"_,_"]°$"_ through _"
    )⊸≠@\n
    ∧(⍜(↘⊙↙|⨬(↥1|↧0|¬):)°⊟⊙:)⊙⊙(↯⊙0⊟.1e3)
    ⧻⊚
  )
  &p F File
---

---Solution₁
  F ← (
    ⊜(
      :⍣(0°$"turn on _"|1°$"turn off _"|2°$"toggle _")
      +⋯2⊟∩[∩⋕°$"_,_"]°$"_ through _"
    )⊸≠@\n
    ∧(⍜(↘⊙↙|⨬(+1|↥0-1|+2):)°⊟⊙:)⊙⊙(↯⊙0⊟.1e3)
    # ⧻⊚
  )
  
  &fwa"image2.bmp" &ime"bmp" ÷/↥⊸♭ F File

  # &p F File
---
