Ca ← ⊂+@2⇡8"TJQKA"
Na ← ⇌ⁿ⇡5⧻Ca

SolutionA ← (
  :⊜(⋕⊓↘↙+1,,5)≠@\n.   # parse data
  ⊕□≡(⧻⊚⊞=.)..         # sort by type of hand
  ▽≠0≡◇⧻.              # remove empty
  /◇⊂≡⍚(⊏⍏/+×Na⍉⊗:Ca.) # sort by first different card
  /+×+1⇡⧻. ⊏⊗          # find the winnings
)

SolutionA&fras"./input.txt"
## 250453939

Cb ← "J23456789TQKA"
Nb ← ⇌ⁿ⇡5⧻Cb

SolutionB ← (
  .⊜(⊙⋕°$"_ _")≠@\n.                       # parse data
  ≡(⧻⊚⊞=.⍜▽≡⋅∘=@J.:⍣(⊡⊢)⋅⋅@K⍖°⊚⊗..▽≠@J..). # sort by type of hand
  ▽≠0≡◇⧻.⊕□                                # remove empty
  /◇⊂≡⍚(⊏⍏/+×Nb⍉⊗:Cb.)                     # sort by first different card
  /+×+1⇡⧻. ⊏⊗                              # find the winnings
)

SolutionB&fras"./input.txt"
## 248652697
