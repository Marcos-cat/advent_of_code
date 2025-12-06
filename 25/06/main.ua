Input ← &fras "input.txt"

Parse ← (
  °⊂⌟⊜∘⊸≠@\n
  ⊓(⊃(/↥≠@\s|⍉)|⨂"+*"▽⊸≠@\s)
  ⊜(□∩⋕⟜⍉)
)

Math ← /+˜⨬◇/+◇/×

Part₁ ← Math◌
Part₂ ← Math⊙◌

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
