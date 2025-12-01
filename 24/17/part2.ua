Prg ← ↘₃⊜⋕⊸∊+@0⇡10&fras"./input.txt"
Cmb ← ⍥(⊏-₄)⊸>₃
Dv  ← ⍜⊏◌⊙⤙(⌊÷⊃(ₑ₂Cmb)⋅⊢)
X   ← ⍜⋯/≠⊟
Bxl ← ⍜⊙⊏₁X
Bst ← °⊸⊏₁◿₈⊸Cmb
Jnz ← ⊃⋅∘(⨬∘⋅∘⊃⋅(=₀⊢)⊙⋅∘)
Bxc ← °⊸⊏₁/X⊸⊏1_2◌
Out ← ⟜(˙⍤≍˜↙Prg⊸⧻↘₃)˜⊂◿₈⊸Cmb
Op  ← ⨬(Dv0|Bxl|Bst|Jnz|Bxc|Out|Dv1|Dv2)
Run ← ↘₃⊙◌⍢⍣(Op°⊟⊏+0_1⊙Prg⤙⊙+₂|°⊸⊢∞)(≠∞⊢)⊙0

⍢∘(⊸(¬≍Prg Run⬚0↙₃) ⍥⊸&p=₀⊸◿₁₀₀₀₀ +₁) 0
