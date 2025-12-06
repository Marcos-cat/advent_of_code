Input ← &fras"input.txt"

Preprocess ← (
  ⊜∘⊸≠@\n
  °˜⊂⌟
  =@+▽⊸≠@\s
)
P₁ ← (
  ⊙(⍉≡⊜⋕⊸≠@\s)
  /+⨬/×/+
)
P₂ ← (
  ⊙(⊃(/↥≠@\s|⍉)
    ⊜(⊃/×/+⋕))
  /+⍜⊙-×
)

⁅₅⍜now(◌⊃P₁P₂ Preprocess Input)
