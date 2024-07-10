$ R 6 (#70c710)
$ D 5 (#0dc571)
$ L 2 (#5713f0)
$ D 2 (#d2c081)
$ R 2 (#59c680)
$ D 2 (#411b91)
$ L 5 (#8ceee2)
$ U 2 (#caa173)
$ L 1 (#1b58a2)
$ U 2 (#caa171)
$ R 2 (#7807d2)
$ U 3 (#a77fa3)
$ L 2 (#015232)
$ U 2 (#7a21e3)
Input ←
Dirs ← map"LURD"[∩¯,,⇌.1_0]
Parse ← get:Dirs⊓⊓⊢⋕◌°$"_ _ _"
Align ← -¤/↧.
Intersects ← ↧⊃(>)⋅(/≠>+0.5) ⊃(°[.]⊡⊓¬⍉|⊏⊙◌|⊡⊙⍉) ⊢⊚/≠. :
Instructions ← ⊜Parse¬∊:"\n\r". &fras"./input.txt" # Input
Vertices ← Align\+×Instructions
Edges ← Align\+▽:Instructions

≡⊟↻¯1.Vertices
⟜:⍜°⊚¬Edges
⊞Intersects

°⊚▽↧ ∩(◿2/+) °⊟⊕∘=0◿2⇡⧻.⍉
⬚0+ °⊚Edges
°⊚Edges
Input
