local holes, maxx, maxy, minx, miny = { { x = 1, y = 1 } }, 1, 1, 1, 1
for line in io.lines './input.txt' do
    local dir, len = line:match '^([RLDU]) (%d+)'
    len = tonumber(len)
    local pos = holes[#holes]
    if dir == 'R' then
        for x = pos.x + 1, pos.x + len do
            table.insert(holes, { x = x, y = pos.y })
        end
        maxx = math.max(maxx, pos.x + len)
    elseif dir == 'L' then
        for x = pos.x - 1, pos.x - len, -1 do
            table.insert(holes, { x = x, y = pos.y })
        end
        minx = math.min(minx, pos.x - len)
    elseif dir == 'D' then
        for y = pos.y + 1, pos.y + len do
            table.insert(holes, { x = pos.x, y = y })
        end
        maxy = math.max(maxy, pos.y + len)
    elseif dir == 'U' then
        for y = pos.y - 1, pos.y - len, -1 do
            table.insert(holes, { x = pos.x, y = y })
        end
        miny = math.min(miny, pos.y - len)
    end
end
local width, height = maxx - minx + 1, maxy - miny + 1
local grid = {}
for _ = 1, height do
    local row = {}
    table.insert(grid, row)
    for _ = 1, width do
        table.insert(row, false)
    end
end
for _, hole in ipairs(holes) do
    grid[hole.y - miny + 1][hole.x - minx + 1] = true
end
local floods, waves = { { x = 1 - minx + 1, y = 1 - miny + 1 } }, {}
while #floods > 0 do
    while #floods > 0 do
        local flood = table.remove(floods)
        local x, y = flood.x, flood.y
        grid[y][x] = true
        local neighbors = {
            { x = x + 1, y = y },
            { x = x - 1, y = y },
            { x = x, y = y + 1 },
            { x = x, y = y - 1 },
        }
        for _, neighbor in ipairs(neighbors) do
            if
                neighbor.y < 1
                or neighbor.x < 1
                or grid[neighbor.y][neighbor.x]
            then
                goto wet
            end
            for _, wave in ipairs(waves) do
                if neighbor.x == wave.x and neighbor.y == wave.y then
                    goto wet
                end
            end
            table.insert(waves, neighbor)
            ::wet::
        end
    end
    floods, waves = waves, floods
end
local area = 0
for _, row in ipairs(grid) do
    for _, tile in ipairs(row) do
        if tile then area = area + 1 end
    end
end
print(area) -- 46359
