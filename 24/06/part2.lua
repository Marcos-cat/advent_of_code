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
            xi, yi = #row, #grid
        end
    end
end
local width, height = #grid[1], #grid
local function loops()
    local x, y, dx, dy, dir = xi, yi, 0, -1, 1
    while true do
        local nx, ny = x + dx, y + dy
        if nx < 1 or width < nx or ny < 1 or height < ny then return false end
        local tile = grid[ny][nx]
        if tile.blocked then
            if tile.hit[dir] then return true end
            tile.hit[dir] = true
            dx, dy = -dy, dx
            dir = dir % 4 + 1
        else
            x, y = nx, ny
        end
    end
end
local count = 0
for x = 1, width do
    for y = 1, height do
        if (x ~= xi or y ~= yi) and not grid[y][x].blocked then
            local tile = grid[y][x]
            tile.blocked = true
            if loops() then count = count + 1 end
            tile.blocked = false
            table.insert(obstacles, tile)
            for _, obstacle in ipairs(obstacles) do
                for i = 1, 4 do
                    obstacle.hit[i] = false
                end
            end
            table.remove(obstacles)
        end
    end
end
print(count)
