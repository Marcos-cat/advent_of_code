Input ← &fras "input.txt"

Parse ← ⊜∘⊸≠@\n

MaxJolts ← /+⋕≡⌞∧⍜↘(↘+₁◡⨂⟜/↥)¯⇌⇡

Part₁ ← MaxJolts 2
Part₂ ← MaxJolts 12

⊃Part₁ Part₂ Parse Input
