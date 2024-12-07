local grid = {}
local x, y
for line in io.lines './input.txt' do
    local row = {}
    table.insert(grid, row)
    for tile in line:gmatch '[%.#%^]' do
        table.insert(row, { blocked = tile == '#' })
        if tile == '^' then
            x, y = #row, #grid
        end
    end
end
local width, height = #grid[1], #grid
local dx, dy = 0, -1
while true do
    grid[y][x].visited = true
    local nx, ny = x + dx, y + dy
    if nx < 1 or width < nx or ny < 1 or height < ny then break end
    if grid[ny][nx].blocked then
        dx, dy = -dy, dx
    else
        x, y = nx, ny
    end
end
local count = 0
for _, row in ipairs(grid) do
    for _, tile in ipairs(row) do
        if tile.visited then count = count + 1 end
    end
end
print(count)
