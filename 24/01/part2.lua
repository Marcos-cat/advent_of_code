local lefts, rights = {}, {}
for line in io.lines './input.txt' do
    local left, right = line:match '^(%d+)%s+(%d+)$'
    rights[right] = (rights[right] or 0) + 1
    table.insert(lefts, left)
end
local sum = 0
for _, left in ipairs(lefts) do
    sum = sum + tonumber(left) * tonumber(rights[left] or 0)
end
print(sum) -- 22539317
