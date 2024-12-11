local map, heads = {}, {}
for line in io.lines './input.txt' do
    local row = {}
    table.insert(map, row)
    for altitude in line:gmatch '%d' do
        altitude = tonumber(altitude)
        table.insert(row, altitude)
        if altitude == 0 then table.insert(heads, { x = #row, y = #map }) end
    end
end
local width, height = #map[1], #map
local function neighbors(p, altitude)
    local nexts = {}
    for _, dir in ipairs {
        { x = 1, y = 0 },
        { x = 0, y = 1 },
        { x = -1, y = 0 },
        { x = 0, y = -1 },
    } do
        local x, y = p.x + dir.x, p.y + dir.y
        if 1 <= x and x <= width and 1 <= y and y <= height then
            if map[y][x] == altitude then
                table.insert(nexts, { x = x, y = y })
            end
        end
    end
    return nexts
end
local part1, part2 = 0, 0
for _, head in ipairs(heads) do
    local paths = { head }
    for altitude = 1, 9 do
        local nexts = {}
        for _, path in ipairs(paths) do
            for _, neighbor in ipairs(neighbors(path, altitude)) do
                table.insert(nexts, neighbor)
            end
        end
        paths = nexts
    end
    local distinct = {}
    for _, done in ipairs(paths) do
        distinct[('%u,%u'):format(done.x, done.y)] = true
    end
    for _, _ in pairs(distinct) do
        part1 = part1 + 1
    end
    part2 = part2 + #paths
end
print(part1, part2)
