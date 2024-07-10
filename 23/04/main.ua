File ← &fras"./input.txt"
Lines! ← ⊜^!≠@\n.
Winners ← /+⍉∊⋅∩(⊜⋕≠@ .)°$"_:_|_"
Score ← /+ⁿ-1:2▽≠0.
Cards ← /+∧(⬚0+↯⊙⊃⊢(↻1))⟜=.
# /+∧(⬚0+↯⊙⊃⊢(↻1))⟜=.⊜(⧻⊚∊∩(⊜⋕⊸≠@ )◌°$"_:_|_")⊸≠@\n
SolutionOne ← Score Lines!Winners
SolutionTwo ← Cards Lines!Winners
