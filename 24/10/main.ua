Input ← &fras"./input.txt"
# Experimental!
Map    ← -@0⊜∘⊸≠@\n Input
Heads  ← ⊚=0Map
Bounds ← ▽≡/×/≠⊸⊞<⊟0⧻Map
Dirs   ← [◡∩¯⟜⇌⋯2]
Neis   ← ≡⊂⟜(▽=)+₁⊙(⊡,Map Bounds+Dirs¤)°⊂

S! ← /+≡(⧻^0⊙◌astar(Neis|1|≍9⊢))≡⊂0Heads

# ⊃S!∘S!(◴⍚⊣) # 667 1344

# Experimental!

S! ← ⊙◌/+≡(⧻^0astar(▽=1≡/+⌵◇⊸-¤⟜(⊏+1⊡)|=9⊡))◇⊙𝄈∩¤⊸⊢⊕□,°⊡⊜≡⋕⊸≥@0
⊃S!∘S!(◴⍚⊣) Input
