Input ← &fras "input.txt"

Parse ← ⊸(≡/×+₁⌵≡/- ⧅₂<) ↯∞_2⊜⋕⊸∊+@0⇡10

Part₁ ← /↥

Part₂ ← (
  ⊙(
    ⍜≡°⊟∩⍜◴⍥₂⍏

    ⊃(⍜≡°⊟⊃↧(+₁↥) ⧅₂<          # All compressed rects
    | /◇⊂⍚(+¤⟜(⊞×⇡/+°˜×-)) ⊸↻₁ # Make the border by interpolating

      /×[˙⍜⊓(⍉|⇌⍉|⇌|∘)∩₄\↥] °⊚  # Make the grid
      ⊸(⊟⤚(⊚¬≡⊏)⊸(⊢⍖⧈↧⌵⬚0⧈-/+)) # Find outliers
    )
  )

  ∩⌞⊏⊸⍖
  ⊙(
    ⊙⋅⋅◌⍢+₁(
      °⊟⊏
      ◡(/↥/×≠∩⌟≤)
      ⨬(¬/×♭↘⊙↙ ⊙⊙◌|1)
    ) 0
  )
  ˜⊏
)

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
