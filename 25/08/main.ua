Input ← &fras "input.txt"

# Connections Positions ? Input
Parse ← ⊃(⊏⍏/+°√/-⍉ ∩⧅₂< °˜⊏)≡⊢ ↯∞_3⊜⋕¬⊸∊"\n,"

Size ← 1000

# Solution 1

Part₁ ← (
  ↙Size
  ◌⍢(
    ⍥(⊂⟜(∩⌟▽⟜¬/+⍉⊸∊♭))∞ ⊃↙↘1
    ⊃⋅∘(˜⊂⧻◴♭⊙⋅∘)
  | ±⧻
  ) ⊙[]
  /×⊏↙3⊸⍖
)

Mask ← ⬚0↙Size°⊚
Link ← ⨬(⋅⊂|⊂⊙(↥/↥)∩⌟▽⊸¬) ⤚⊸(⊸⬚0/↥≡/↥×¤)

Part₂ ← (
  ⊙≡⊢
  ⊙(°△0_Size)
  ⍢(⊃(⊓+₁∘|Link Mask⊏)|¬/×⬚0⊢ ◌◌) 0
  /×⊏⊙◌⊏-₁
)

# Solution 1.5

Link ← ˜⊂□◴⍆⊂⟜(/◇⊂∩⌟▽⟜¬⊸≡⌞◇(/↥∊))

Part₂ ← (
  ⊓(⇌|≡⊢)
  /×⊏⊓⊣⋅∘⍢(⟜(Link⊣)↘₋₁|≠Size◇⧻⬚[]⊢◌)˜⊂0 ⊙{}
)

# Solution 2

Graph ← ⇡Size

# Better link functions thanks to @sky.frog
Link ← ⨬◌(⍜▽\↧⊸∊)⊸/≠ ⊸⊏
Link ← ⨬◌(+×⊃⊢(⊃¬×⊸≠⊣))⊸/≠ ⊸⊏

Part₁ ← /× ↙₃⇌⍆ °⊚ ∧Link⊙Graph ↙Size

Part₂ ← /×⊏⊏-₁⊙⊙◌⍢(⊃(+₁⊙∘|Link⊏)|¬/×⧈≍ ⋅⋅∘)0⊙Graph

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
