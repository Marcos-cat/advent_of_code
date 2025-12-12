Input ← &fras "input.txt"

Parse ← ⊜(
  °$"[_] _ {_}"
  ⊓{=@#|⬚0⊜(°⊚⊜⋕⊸≠@,°$"(_)")⊸≠@\s|⊜⋕⊸≠@,}
)⊸≠@\n

Part₁ ← /+˜≡◇(⊙⋅◌⍢+₁(¬∊ ≡/≠ ⧅<) 1) ≡⊢₂

# ? Buttons Goal
Presses ← |2 memo(
  ◡⋅(/×=0)
  ⨬(⟜(
      ˜-⊃⋅¤(∩≡/+⤚(×⊙¤)⋯⇡ₑ₂⊸⧻)
      ÷₂∩⌞▽⊸(≡/× ×⊃(≥₀|=₀◿₂))
    )
    ⨬(∞|/↧+×₂≡⌞Presses) ◡⋅(±⧻)
  | 0)
)

Part₂ ← (
  /+ ˜≡◇Presses ≡⊣₂
)

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
