Input ← &fras"input.txt"
Lines! ← ⊜^!⊸≠@\n
FileSize ← °□⊢°□
Dirs ← °□⊢°□
ToDir ← □/$"_/_"⇌
Files ← °□⊡1°□
Cd ← ⍣(⋅{"ROOT"}°"/"|↘1°".."|⊂□)
Step ← ◇⍣(
  Cd °$"$ cd _"
| ⟜(insertToDir⊙(□{{}{}})) °"$ ls"
| ⟜(⍜⊙(Dirs get)⊂ :ToDir): □°$"dir _" ⊙⊙∘
| ⟜(⍜⊙(Files get)⊂ :ToDir): □{⊙∘}⋕°$"_ _"⊙⊙∘
)
FileSystem ← ◌∧Step⊙({} map{}{}) Lines!□Input
AllDirs ← ⊙◌°mapFileSystem
Size ← |1 /+ ⊂⊃(♭≡Size ⍚$"_/_"¤⊙Dirs|♭≡FileSize Files ◌) ⟜get⊙FileSystem

---
SolutionI ← /+ ▽⊸≤100000 ≡Size AllDirs
SolutionI
---

---
DiskSpace ← 70000000
NeededSpace ← 30000000
FreeSpace ← -Size"ROOT"DiskSpace
SolutionII ← ⍜(+FreeSpace|⊢▽⊸≥NeededSpace) ⊏⊸⍏ ≡Size AllDirs
SolutionII
---
