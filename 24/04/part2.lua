local grid = {}
for line in io.lines './input.txt' do
    local row = {}
    for c in line:gmatch '[XMAS]' do
        table.insert(row, c)
    end
    table.insert(grid, row)
end
local width, height = #grid[1], #grid
local function xmas(x, y)
    if grid[y][x] ~= 'A' then return false end
    local major = grid[y - 1][x - 1] .. grid[y + 1][x + 1]
    local minor = grid[y - 1][x + 1] .. grid[y + 1][x - 1]
    return (major == 'MS' or major == 'SM') and (minor == 'MS' or minor == 'SM')
end
local count = 0
for x = 2, width - 1 do
    for y = 2, height - 1 do
        if xmas(x, y) then count = count + 1 end
    end
end
print(count) -- 1902
