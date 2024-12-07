local grid, obstacles = {}, {}
local xi, yi
for line in io.lines './input.txt' do
    local row = {}
    table.insert(grid, row)
    for tile in line:gmatch '[%.#%^]' do
        local obstacle = { blocked = tile == '#', hit = {} }
        if obstacle.blocked then table.insert(obstacles, obstacle) end
        table.insert(row, obstacle)
        if tile == '^' then
            obstacle.start = true
            xi, yi = #row, #grid
        end
    end
end
local width, height = #grid[1], #grid
local function loops(first, new)
    if new then new.blocked = true end
    local x, y, dx, dy, dir = xi, yi, 0, -1, 1
    local looped
    while true do
        if first then grid[y][x].visited = true end
        local nx, ny = x + dx, y + dy
        if nx < 1 or width < nx or ny < 1 or height < ny then
            looped = false
            break
        end
        local tile = grid[ny][nx]
        if tile.blocked then
            if tile.hit[dir] then
                looped = true
                break
            end
            tile.hit[dir] = true
            dx, dy = -dy, dx
            dir = dir % 4 + 1
        else
            x, y = nx, ny
        end
    end
    if new then
        new.blocked = false
        table.insert(obstacles, new)
    end
    for _, obstacle in ipairs(obstacles) do
        for i = 1, 4 do
            obstacle.hit[i] = false
        end
    end
    if new then table.remove(obstacles) end
    return looped
end
local part1 = 0
loops(true)
for _, row in ipairs(grid) do
    for _, tile in ipairs(row) do
        if tile.visited then part1 = part1 + 1 end
    end
end
local part2 = 0
for x = 1, width do
    for y = 1, height do
        local tile = grid[y][x]
        if tile.visited and not tile.start and not tile.blocked then
            if loops(false, tile) then part2 = part2 + 1 end
        end
    end
end
print(part1, part2)
