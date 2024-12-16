local nums, part1, part2 = {}, 0, 0
local function solve(add, a, c, b, d, X, Y)
    X, Y = X + add, Y + add
    local det = a * d - b * c
    local A, B = (d * X - b * Y) / det, (a * Y - c * X) / det
    if A == math.floor(A) and B == math.floor(B) then
        return 3 * A + 1 * B
    else
        return 0
    end
end
for num in io.open('./input.txt'):read('a'):gmatch '%d+' do
    table.insert(nums, tonumber(num))
    if #nums == 6 then
        part1 = part1 + solve(0, table.unpack(nums))
        part2 = part2 + solve(1e13, table.unpack(nums))
        nums = {}
    end
end
print(string.format('%u %u', part1, part2))
