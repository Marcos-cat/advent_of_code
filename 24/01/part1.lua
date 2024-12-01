local lefts, rights = {}, {}
for line in io.lines './input.txt' do
    local left, right = line:match '^(%d+)%s+(%d+)$'
    table.insert(lefts, tonumber(left))
    table.insert(rights, tonumber(right))
end
table.sort(lefts)
table.sort(rights)
local sum = 0
for i = 1, #lefts do
    sum = sum + math.abs(rights[i] - lefts[i])
end
print(sum) -- 1941353
