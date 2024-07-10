File ← &fras"input.txt"

---Solution₁
  F ← /+⊜(⋕⊟∩⊢⟜⇌▽↧⊸⊓≥≤@0,@9)≠@\n.
  F ← /+⊜(+×10∩⊢⟜⇌▽⊸±∵⍣⋕0)⊸≠@\n
  F ← /+⊜(⋕⊟∩⊢⟜⇌▽⊸∵⍣⋕0)⊸≠@\n
  F ← /+⊜(⋕⊏0_¯1▽⊸∵⍣⋕0)⊸≠@\n
  F ← /+⊜(⋕⊏⋯¯2▽⊸∵⍣⋕0)⊸≠@\n
  F ← /+⊜(⋕⊏⋯¯2▽⊸≤@9)⊸≠@\n
  
  &p F File
---

---Solution₂
  Nums ← ⊜□≠@,."one,two,three,four,five,six,seven,eight,nine"
  Digits ← +@1⇡9
  FindNums ← /↥↥∩(×+1⇡⧻.≡◇⌕)Digits,Nums¤
  FirstLast ← ⋕⊟∩⊢⟜⇌+@0▽≠0. FindNums
  
  SolTwo ← /+⊜FirstLast ≠@\n.File
  
  Nums ← ⊜□⊸≠@,"one,two,three,four,five,six,seven,eight,nine"
  F ← /++×10⊜(∩⊢⟜⇌▽⊸±/↥⊂×+1°⊏≡◇⌕Nums¤⟜∵⍣⋕0)⊸≠@\n
  F ← /++×10⊜(∩⊢⟜⇌▽./↥⊂×+1°⊏≡◇⌕Nums¤⟜∵⍣⋕0)⊸≠@\n

  &p F File
---
