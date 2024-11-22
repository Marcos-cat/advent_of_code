File ← &fras"./input.txt"
~ "git: Marcos-cat/makros" ~ Struct!

---Map
  Struct![Start End Diff]
---
---Alm
  Struct![Dest Src Len]
  ToMap ← Map~New ⊙⊓+-⟜⊃⊙Len⊙Dest⊸Src
---

F ← (
  ⊜□¬⊸⦷"\n\n"
  ⍚(⊜(⊜⋕⊸≠@ )⊸≠@\n◌°$"_:_")
  :°(⊂□¤)
  ⍚Alm~ToMap

  /↧∧(+/+×⊸◇⊃(↧⊓≤>⊃⊙Map~Start⊙Map~End¤:|Map~Diff))
)

&p F File
