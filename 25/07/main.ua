Input ← &fras "input.txt"

Parse ← ⊃(▽⊸≠□[]⍚⊚=@^|¤˜⨂@S⊢)⊜∘⊸≠@\n

Collide ← ⊂⊃(♭⊞+A₁˜(▽⊸∊)|▽¬⊸∊)
Part₁   ← ◌∧◇⊃(◴Collide|+/+∊) ⊙⊙0
Part₂   ← /+◌∧◇(⊃◴(⊕/+⊛)⊃(/◇⊂|▽≡◇⧻) ⍚⌞Collide) ⊙⊙[1]

Parse ← ⊃(▽⊸(/↥⍉)=@^|=@S⊢)⊜∘⊸≠@\n

Split ← +⊃(×=0|+⊃↻₁°↻₁×)
Part₁ ← ◌∧⊃(±Split|+/+×)⊙⊙0
Part₂ ← /+∧Split

⁅₅⍜now(⊃Part₁ Part₂ Parse) Input
