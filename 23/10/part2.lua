local grid = {}
local start
for line in io.lines './input.txt' do
    local row = {}
    table.insert(grid, row)
    for pipe in line:gmatch '.' do
        table.insert(row, pipe)
        if pipe == 'S' then start = { x = #row, y = #grid } end
    end
end
local pos, dir = { x = start.x, y = start.y }, { x = 1, y = 0 }
local points, perimeter = { start }, 0
repeat
    perimeter = perimeter + 1
    pos.x, pos.y = pos.x + dir.x, pos.y + dir.y
    table.insert(points, { x = pos.x, y = pos.y })
    local pipe = grid[pos.y][pos.x]
    if pipe == 'F' or pipe == 'J' then
        dir.x, dir.y = -dir.y, -dir.x
    elseif pipe == 'L' or pipe == '7' then
        dir.x, dir.y = dir.y, dir.x
    end
until pos.x == start.x and pos.y == start.y
local area = 0
for i = 1, #points - 1 do -- Shoelace formula!!!
    area = area + points[i].y * (points[i].x - points[i + 1].x)
end
print(area - perimeter / 2 + 1) -- 491
