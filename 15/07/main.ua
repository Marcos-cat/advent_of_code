# Experimental!

File ← &fras"./input.txt"

~ "git: github.com/Marcos-cat/makros" ~ Enum! Match! Struct!

---Gate
  ---Type
    Enum![Id Not And Or Shift]
  ---
  Struct!{Op Inputs}
  Parse ← New ⍣(
    Type~Not {°$"NOT _"}
  | Type~And {°$"_ AND _"}
  | Type~Or {°$"_ OR _"}
  | Type~Shift {⍥⊙¯≍"L"⊓:⋕°$"_ _SHIFT _"}
  | Type~Id {∘}
  )
---

Circuit ← map: ≡◇Gate~Parse ⍚°$"_ -> _" ⊜□⊸≠@\n File

Bit! ← ⍜⋯(^!⬚0↙16)

Evaluate ← |2 memo⍣⊓⋕◌(
  °Gate~New⊸get

  Match!(
    Gate~Type~Id -> Evaluate⊢
  | Gate~Type~Not -> Bit!¬ Evaluate⊢
  | Gate~Type~And -> ⍜⋯/↧ ≡Evaluate⊙¤
  | Gate~Type~Or -> ⍜⋯/↥ ≡Evaluate⊙¤
  | Gate~Type~Shift -> Bit!(⬚0↻:) °{⊙∘} ⍜⊢Evaluate
  )
)

Evaluate "a" insert "b" Gate~New Gate~Type~Id {∘} ⊸Evaluate "a" Circuit

---Solution₁
  F ← ⊢
  # &p F File
---

---Solution₂
  F ← ⊢
  # &p F File
---
