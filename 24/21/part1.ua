# Experimental!
┌─╴Node
  New  ← ⊂⊙0⊢⊚=@A
  Pos  ← ↙₂
  Code ← ⊣
└─╴

NumPad ← ⊂+@1°△¯3_3" 0A"
DirPad ← " ^A"_"<v>"

Move   ← ▽≠@ ⤚(⬚@ ⊡≡Node~Pos) ⍜≡Node~Pos(+A₂)↯4
Press  ← ↯=⊃(⊡Node~Pos|⊡⊣⊙⋅∘|⍜Node~Code+₁)
Next   ← ⊂⊃Move Press
Instrs ← path(Next|≍⊓Node~Code⋅⧻) ⊸Node
ToDirs ← ⊏⊙">v<^A"⊗⊙A₂⧈-≡Node~Pos
Trim   ← ▽⊸≡(/×⊜(/×◰◌°▽))⊸≠@A
Robot  ← /◇⊂ ▽=⊸/↧⊸≡◇(⧻⊢) ⍚⌞Instrs DirPad Trim≡ToDirs

Run ← ⧻⊢ Robot Robot Instrs NumPad

Part₁ ← /+×⊜⊃(-₁Run|⋕↘₋₁)⊸≠@\n

Part₁ &fras"./input.txt"
