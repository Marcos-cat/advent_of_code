# File ← ⊜∘≠@\n. &fras"./input.txt"
#
# IsNum ← ↧⊓≥≤@0,@9                                   # Makes mask of digits in char array
# Around ← ◴/⊂⊞+/⊂⊞⊟.1_0_¯1                           # Turns list of points to list of points in square around each point
# Nums ← ⊙⍜⍉(-0_1)∩▽¬,,◿2⇡⧻.⊚≡(≡/≠◫2 ⍜⇌(⊂0) ⊂0) IsNum # Turns 2x2 char array to a list of points at start and end of numbers
# SolOne ← /+▽ ↥∩∊⊙, ⊃(Nums|Around⊚¬↥⊃(=@.)IsNum|⊜⋕IsNum.) File

f ← &fras"./input.txt"             # file
p ← ⊜∘≠@\n.f                       # parsed
g ← ⊚=@*p                          # gears
a ← ≡(≡+¤)⊙(¤/⊂⊞⊟.1_0_¯1)          # around a gear
n ← ↧⊓≥≤@0,@9p                     # numbers
r ← ⊜⋕n p                          # 'ratios'
s ← ⊕(⍣⊢∞ ⊚ ≡/↥ ≡∊: a g ¤)⊚⊜/+.⟜⊚n # what gear a ratio belongs to
∊s ⍜°⊚(=2)▽≠∞. s
/+▽≠1.⊕/× ∩▽,s⊙r
