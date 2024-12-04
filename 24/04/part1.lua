local grid = {}
for line in io.lines './input.txt' do
    local row = {}
    for c in line:gmatch '[XMAS]' do
        table.insert(row, c)
    end
    table.insert(grid, row)
end
local width, height = #grid[1], #grid
local function xmas(x, y, dx, dy)
    for c in ('XMAS'):gmatch '.' do
        if x < 1 or width < x or y < 1 or height < y or grid[y][x] ~= c then
            return false
        end
        x, y = x + dx, y + dy
    end
    return true
end
local count = 0
for x = 1, width do
    for y = 1, height do
        for dx = -1, 1 do
            for dy = -1, 1 do
                if xmas(x, y, dx, dy) then count = count + 1 end
            end
        end
    end
end
print(count) -- 2562
