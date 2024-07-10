Input ← ↘¯1&fras"input.txt"
Old ← ∞
NewOperation ← {⊙∘}⊓(⊗:"*+"⊢|⍣(Old°"old"|⋕))°$"old _ _"
GetOperation ← °□⊡0
GetOperand ← °□⊡1
Operate ← ⟨×|+⟩⍥⊙⋅.=Old,⊃(GetOperation|GetOperand)

NewTest ← (
  °$$ divisible by _
   $$     If true: throw to monkey _
   $$     If false: throw to monkey _
  {∩⋕⊙{:⊙∘}}
)
GetDivisor ← °□⊡0
GetReceivingMonkeys ← °□⊡1
Test ← ⊡=0◿⊃(GetDivisor|⋅∘|GetReceivingMonkeys)

NewMonkey ← (
  °$$ Monkey _:
   $$   Starting items: _
   $$   Operation: new = _
   $$   Test: _
  {⊙⊙∘}⋅⊓(⊜⋕¬⊸⦷", "|NewOperation|NewTest)
)
GetStartItems ← °□⊡0
GetOperation ← °□⊡1
GetTest ← °□⊡2

# Relief ← ⌊÷3 
Relief ← ∘
# Rounds ← 20
Rounds ← 10000
Monkeys ← ⊜NewMonkey¬⊸⦷"\n\n"Input

Throw ← ⍜(°□⊡)⊂ ⊙:⊸Test GetTest:Relief Operate GetOperation,
Turn ← ⊃(∧Throw⊃(°□⊡|¤⊡:Monkeys|⍜⊡⋅(□[]))|⍜⊡+⊙:⟜(◇⧻⊡))

Inspections ← ◌∧Turn /⊂↯Rounds⇡⧻Monkeys GetStartItems⍉Monkeys ⊚⧻Monkeys
Solution ← /×↙2⊏⊸⍖Inspections
Solution
