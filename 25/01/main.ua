Input ← &fras "input.txt"

Parse ← ⍥¯=@L⊜(⊙⋕°⊂)⊸≠@\n

Password! ← /+=0◿100\+^⊂50
Part₁     ← Password!∘
Part₂     ← Password!(˜▽°×)
Part₂     ← ÷₂+∩(/+⌵⧈-⌊÷100)⊸-₁\+⊂50

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
