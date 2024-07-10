Input ← &fras"input.txt"
Lines! ← ⊜^!⊸≠@\n
Parse ← □⍣(0°"noop"|⊟0⋕°$"addx _")
RegisterValues ← \+⊂1/◇⊂Lines!Parse Input
---
SolutionI ← /+×⟜(⊏-1)+20×40⇡6 RegisterValues
---
---
SpriteX ← RegisterValues
SolutionII = /$"_\n_"↯6_40⟨@ |@8⟩≡∊ ◿40⇡⧻SpriteX +¤¯1_0_1SpriteX
&pSolutionII
---
