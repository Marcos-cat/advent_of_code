Input ← &fras "input.txt"

# Order Connections Positions ? Input
Parse ← ⊸(⍏/+°√/-⍉ ∩⧅₂< °˜⊏) ↯∞_3⊜⋕¬⊸∊"\n,"

Size ← 1000

# Solution 1

Part₁ ← (
  ⊏↙Size
  ◌⍢(
    ⍥(⊂⟜(∩⌟▽⟜¬/+⍉⊸∊♭))∞ ⊃↙↘1
    ⊃⋅∘(˜⊂⧻◴♭⊙⋅∘)
  | ±⧻
  ) ⊙[]
  /×⊏↙3⊸⍖
)

Mask    ← ⬚0↙Size°⊚
Connect ← ⨬(⋅⊂|⊂⊙(↥/↥)∩⌟▽⊸¬) ⤚⊸(⊸⬚0/↥≡/↥×¤)

Part₂ ← (
  ⊓(⊏|≡⊢)
  ⊙(°△0_Size)
  ⍢(⊃(⊓+₁∘|Connect Mask⊏)|¬/×⬚0⊢ ◌◌) 0
  /×⊏⊙◌⊏-₁
)

# Solution 1.5

Connect ← ˜⊂□◴⍆⊂⟜(/◇⊂∩⌟▽⟜¬⊸≡⌞◇(/↥∊))

Part₂ ← (
  ⊓(⊏⇌|≡⊢)
  /×⊏⊓⊣⋅∘⍢(⟜(Connect⊣)↘₋₁|≠Size◇⧻⬚[]⊢◌)˜⊂0 ⊙{}
)

⍜now(⊃Part₁ Part₂ Parse) Input
