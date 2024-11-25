local tiles = {}
for line in io.lines './input.txt' do
    table.insert(tiles, {})
    for tile in line:gmatch '.' do
        table.insert(tiles[#tiles], {
            mirror = tile == '.' and nil or tile,
        })
    end
end
local width, height = #tiles[1], #tiles
local function shine(startbeam)
    for _, row in ipairs(tiles) do
        for _, tile in ipairs(row) do
            tile.energized = false
            tile.split = false
        end
    end
    local beams = { startbeam }
    local splits, absorbed = {}, {}
    while #beams > 0 do
        for i, beam in ipairs(beams) do
            local x, y = beam.x, beam.y
            if 1 <= x and x <= width and 1 <= y and y <= height then
                tiles[beam.y][beam.x].energized = true
            end
            beam.x, beam.y = beam.x + beam.dirx, beam.y + beam.diry
            x, y = beam.x, beam.y
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
                        table.insert(
                            splits,
                            { x = x, y = y, dirx = 1, diry = 0 }
                        )
                        table.insert(
                            splits,
                            { x = x, y = y, dirx = -1, diry = 0 }
                        )
                    end
                    table.insert(absorbed, i)
                elseif mirror == '|' and beam.diry == 0 then
                    if not tiles[y][x].split then
                        tiles[y][x].split = true
                        table.insert(
                            splits,
                            { x = x, y = y, dirx = 0, diry = 1 }
                        )
                        table.insert(
                            splits,
                            { x = x, y = y, dirx = 0, diry = -1 }
                        )
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
    return energized
end
local max = 0
for x = 1, width do
    max = math.max(max, shine { x = x, y = 0, dirx = 0, diry = 1 })
    max = math.max(max, shine { x = x, y = height + 1, dirx = 0, diry = -1 })
end
for y = 1, height do
    max = math.max(max, shine { x = 0, y = y, dirx = 1, diry = 0 })
    max = math.max(max, shine { x = width + 1, y = y, dirx = -1, diry = 0 })
end
print(max)
