local grid, startx, starty, posx, posy = {}
for line in io.lines './input.txt' do
    local row = {}
    table.insert(grid, row)
    for pipe in line:gmatch '.' do
        table.insert(row, pipe)
        if pipe == 'S' then
            startx, starty = #row, #grid
            posx, posy = startx, starty
        end
    end
end
local steps, dirx, diry = 0, 1, 0
repeat
    steps = steps + 1
    posx, posy = posx + dirx, posy + diry
    local pipe = grid[posy][posx]
    if pipe == 'F' or pipe == 'J' then
        dirx, diry = -diry, -dirx
    elseif pipe == 'L' or pipe == '7' then
        dirx, diry = diry, dirx
    end
until posx == startx and posy == starty
print(steps / 2) -- 6882
