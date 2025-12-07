Input ← &fras "input.txt"

# This first solution uses indices instead of arrays, which was mostly a 
# mistake, but it was the first thing I thought of.

# I saw the empty lines in the sample, and realized that they did literally
# nothing, so I removed them in the parsing step just to not have to deal with 
# them.
# Splitters StartTachyon ? Input
Parse ← ⊃(▽⊸≠□[]⍚⊚=@^|¤˜⨂@S⊢)⊜∘⊸≠@\n

# Split does a set intersection to find the tachyons that hit the splitters,
# and then shifts them left and right, joining to that the tachyons that didn't
# hit anything, which is a set subtraction.
# Tachyons ? Splitters Tachyons
Split ← ⊂⊃(♭⊞+A₁˜(▽⊸∊)|▽¬⊸∊)

# Part1 iterates over all the rows of splitters and calls Split, deduplicating
# the tachyons that are in the same place. It counts the number of splits with
# an accumulator that is incremented by how many tachyons hit a splitter at
# that step.
# SplitCount ? Splitters StartTachyon
Part₁ ← ◌∧◇⊃(◴Split|+/+∊) ⊙⊙0

# Part2 does similarly, but instead of deduplicating, I keep an array of counts
# of how many tachyons are in one spot but in parallel universes, and I add
# counts together if tachyons are move into the same space. I also have to
# consider each tachyon and splitter individually due to how Split is written.
# I return the sum of all the counts at the end.
# TotalTachyons ? Splitters StartTachyon
Part₂ ← /+◌∧◇(⊃◴(⊕/+⊛)⊃(/◇⊂|▽≡◇⧻) ⍚⌞Split) ⊙⊙[1]

# This second solution uses arrays to store the tachyons, which leads to
# infinitely more elegant manipulations of the data for splitting.

# The parsing step is largely the same, except for the lack of Where.
# I also still make sure to remove empty rows since all tachyons just pass
# through.
# Splitters StartTachyon ? Input
Parse ← ⊃(▽⊸(/↥⍉)=@^|=@S⊢)⊜∘⊸≠@\n
Parse ← °˜⊂▽⊸(/↥⍉)≠@.⊜∘⊸≠@\n

# Split is the sum of two fork tines, the tachyons that pass through, and the
# ones that split. To pass through, the must be no splitters, so I mask by
# where there are not splitters. The second tine, I mask by where there are 
# splitters and then shift the tachyons right and left, adding the two 
# together.
# Tachyons ? Splitters Tachyons
Split ← +⊃(×¬|+⊃↻₁°↻₁×)

# Once again Part1 iterates through and splits for each row, but now using Sign
# to deduplicate the tachyons, and Multiply to find where tachyons are getting
# split instead of Memberof.
# SplitCount ? Splitters StartTachyon
Part₁ ← ◌∧⊃(±Split|+/+×)⊙⊙0

# Part2 now becomes extremely simple, just splitting for each row, and then
# summing the counts of tachyons in each position.
# TotalTachyons ? Splitters StartTachyon
Part₂ ← /+∧Split

# This combines both the above solutions into one, so that I only have to 
# iterate a single time.
# SplitCount TotalTachyons ? Splitters StartTachyon
BothParts ← ˜⊙∘/+∧⊃(Split|+/+±×)⊙⊙0

⁅₅⍜now(BothParts Parse) Input
