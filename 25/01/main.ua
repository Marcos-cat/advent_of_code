Input ← &fras "input.txt"

Parse ← ⍥¯=@L⊜(⊙⋕°⊂)⊸≠@\n

Password! ← /+=0◿100\+^⊂50
Part₁     ← Password!∘
Part₂     ← Password!(˜▽°×)

⊃Part₁ Part₂ Parse Input
