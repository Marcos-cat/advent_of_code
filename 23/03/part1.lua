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
for _, num in ipairs(nums) do
    for _, gear in ipairs(gears) do
        if
            num.x - 1 <= gear.x
            and gear.x < num.x + #num.n + 1
            and math.abs(gear.y - num.y) <= 1
        then
            sum = sum + num.n
            break
        end
    end
end
print(sum)
