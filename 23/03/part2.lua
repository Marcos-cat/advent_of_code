local nums, gears = {}, {}
local y = 1
for line in io.lines './input.txt' do
    for x, n in string.gmatch(line, '()(%d+)') do
        table.insert(nums, { n = n, x = x, y = y })
    end
    for x in string.gmatch(line, '()[^%d%.]') do
        table.insert(gears, { x = x, y = y })
    end
    y = y + 1
end
local sum = 0
for _, gear in ipairs(gears) do
    local touching = {}
    for _, num in ipairs(nums) do
        if
            num.x - 1 <= gear.x
            and gear.x < num.x + #num.n + 1
            and math.abs(gear.y - num.y) <= 1
        then
            table.insert(touching, num.n)
        end
    end
    if #touching == 2 then sum = sum + touching[1] * touching[2] end
end
print(sum) -- 72246648
