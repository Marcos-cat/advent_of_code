# Experimental!
Nodes ← ⊜∘⌵⊸± &fras"./input.txt"
Names ← ◴Nodes
T     ← ⊚=@t≡⊢Names
Graph ← ≡⊚+⊸⍉°⊚↯∞_2 ⊛Nodes

Cycle ← (
  path(▽≤₃⟜≡⊟⊓+₁⊏°⊟|×⊓=₃𝄐≍°⊟) ⤚⊂₀
  ◴≡(⍆↘₁≡⊣)
)

Part₁ ← ⧻◴/◇⊂⍚⌟Cycle T

Part₂ ← (
  ◴♭₂≡≡(⍆⊟)°⊏
  ⊢⍢(◴/◇⊂⍚(▽≡⌟⊃(/×∊⊏⊙Graph|𝄈⊂)⊸(⍜-⇡:⧻Graph+₁⊣))|≠₁⧻)
  /$"_,_"⍆⊏⊙Names
)

Part₂ ← (
  ◴♭₂≡≡(⍆⊟)°⊏
  ⊢⍢(/◇⊂⍚(▽≡⌟⊃(/×∊⊏⊙Graph|𝄈⊂)⊸(▽⊸>⊃⊣(◴♭⊏⊙Graph)))|≠₁⧻)
  /$"_,_"⍆⊏⊙Names
)

:⊃Part₁ Part₂ Graph
