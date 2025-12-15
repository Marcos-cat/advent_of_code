Input ← &fras "input.txt"

Parse ← ⊸(≡/×+₁⌵≡/- ⧅₂<) ↯∞_2⊜⋕⊸∊+@0⇡10

Part₁ ← /↥

Part₂ ← (
  ⊙(
    ⍜≡°⊟∩⍜◴⍥₂⍏

    ⊃(⍜≡°⊟⊃↧(+₁↥) ⧅₂<          # All compressed rects
    | /◇⊂⍚(+¤⟜(⊞×⇡/+°˜×-)) ⊸↻₁ # Make the border by interpolating

      /×[˙⍜⊓(⍉|⇌⍉|⇌|∘)∩₄\↥] °⊚ # Make the grid
      ⊸(⊟⤚(
          ⊚¬≡⊏
          ↙⊙↘⊸(∩⌟(⌊×)⊙⊙⧻)⟜(÷₂¬) 0.4 # Keep only the middle few to speed up comparisons
        )⊸(⊢⍖⧈↧⌵⬚0⧈-/+)
      ) # Find outliers
    )
  )

  ∩⌞⊏⊸⍖
  ⊙(
    ⊙⋅⋅◌⍢+₁(
      °⊟⊏
      ◡(/↥/×≠∩⌟<)
      ⨬(¬/×♭↘⊙↙ ⊙⊙◌|1)
    ) 0
  )
  ˜⊏
)

Part₂ ← (
  ⊙(
    ⍜⍉≡⍜◴⍥₂⍏                                # Compress coordinates
    ⊃(⍜(°⊟⍉|⊃↧(+₁↥))⧅₂<                     # Get all rectangles, NW and SE corners
    | °⊚ /◇⊂⍚(+¤⟜(⊞×⇡/+°˜×-)) ⊸↻₁           # Turn vertices into perimeter
      ⊚ ×⊃(¬|/↥⬚0↻A₂) /×[˙⍜⊓(⍉|⇌⍉|⇌|∘)∩₄\↥] # Turn perimeter into exterior
      ⍉ ⊂⊸⊏⊢⍏⊸(/+°√- ⊃(÷⊃⧻/+)⍉)             # Get "most central" point and put it at the front
    )
  )
  ∩⌞⊏⊸⍖
  ˜⊏⊙(⊙⋅◌⍢+₁(⨬(/↥/×≠∩⌟<|1) ◡(/×≠∩⌟< ⊙⊙≡⊢) °⊟⊏) 0)
)

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
