local tiles = {}
for line in io.lines './input.txt' do
    table.insert(tiles, {})
    for tile in line:gmatch '.' do
        table.insert(tiles[#tiles], { mirror = tile == '.' and nil or tile })
    end
end
local beams = { { x = 0, y = 1, dirx = 1, diry = 0 } }
local width, height = #tiles[1], #tiles
local splits, absorbed = {}, {}
while #beams > 0 do
    for i, beam in ipairs(beams) do
        if beam.x ~= 0 and beam.y ~= 0 then
            tiles[beam.y][beam.x].energized = true
        end
        beam.x, beam.y = beam.x + beam.dirx, beam.y + beam.diry
        local x, y = beam.x, beam.y
        if x < 1 or x > width or y < 1 or y > height then
            table.insert(absorbed, i)
        else
            local mirror = tiles[y][x].mirror
            if mirror == '\\' then
                beam.dirx, beam.diry = beam.diry, beam.dirx
            elseif mirror == '/' then
                beam.dirx, beam.diry = -beam.diry, -beam.dirx
            elseif mirror == '-' and beam.dirx == 0 then
                if not tiles[y][x].split then
                    tiles[y][x].split = true
                    table.insert(splits, { x = x, y = y, dirx = 1, diry = 0 })
                    table.insert(splits, { x = x, y = y, dirx = -1, diry = 0 })
                end
                table.insert(absorbed, i)
            elseif mirror == '|' and beam.diry == 0 then
                if not tiles[y][x].split then
                    tiles[y][x].split = true
                    table.insert(splits, { x = x, y = y, dirx = 0, diry = 1 })
                    table.insert(splits, { x = x, y = y, dirx = 0, diry = -1 })
                end
                table.insert(absorbed, i)
            end
        end
    end
    while #absorbed > 0 do
        table.remove(beams, table.remove(absorbed))
    end
    while #splits > 0 do
        table.insert(beams, table.remove(splits))
    end
end
local energized = 0
for _, row in ipairs(tiles) do
    for _, tile in ipairs(row) do
        if tile.energized then energized = energized + 1 end
    end
end
print(energized)
