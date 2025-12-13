Input ← &fras "input.txt"

Parse ← ⍉ ⊜⊜⋕⊸∩⌟≠ @\n @x

Part₁ ← /+⊂ ⊃(♭×₂|/↧) ×⊸↻₁

Part₂ ← /+⊂ ⊃(×₂-⊃/↥/+|/×)

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
