Input ← &fras "input.txt"

Parse ← ⊜∘⊸≠@\n

MaxJolts ← /+⋕≡⌞∧⍜↘(↘+₁◡⨂⟜/↥)¯⇌⇡
MaxJolts ← /+⋕≡⌞∧⍜↘(°˜⊂↘⊢⊸⍖)¯⇌⇡

Part₁ ← MaxJolts 2
Part₂ ← MaxJolts 12

⁅₅⍜now(⊃Part₁ Part₂ Parse Input)
