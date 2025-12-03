Input ← &fras "input.txt"

Digits ← +₁⌊⁅₁₄°ₑ₁₀

Parse ← (
  ↯∞_2⊜⋕⊸∊+@0⇡10
  /◇⊂⍚⨬¤⍜°⊟(∩⊟⟜(⊸-₁⍜°ₑ₁₀⌈))⊸(≡/-Digits)
  ∩↘₂°⊏ ⊕□ ⊸(Digits≡⊢)
)

# ? Digits Range
Test ← (
  ⌝⊥⊸⊃(ₑ₁₀|⍉↯⊃(÷|/⍜-(⇡+₁)⌊÷ₑ₁₀-)) °⊟
  ▽⤚(×⊓⌞≤≥⊙°⊟)
)

Part₂ ← (
  ⍚(
    ≡⊟⊸(▽=₀⤚◿⊸⇡)
    /◇⊂♭⊞(□Test)
  )
  /+◴/◇⊂
)

Part₂ Parse Input
