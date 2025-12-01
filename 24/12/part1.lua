local farm = {}
for line in io.lines './input.txt' do
    local row = {}
    for crop in line:gmatch '%a' do
        table.insert(row, crop)
    end
    table.insert(farm, row)
end
local width, height = #farm[1], #farm
local function neighbors(p)
    local neis = {}
    for _, dir in ipairs {
        { x = 1, y = 0 },
        { x = 0, y = 1 },
        { x = -1, y = 0 },
        { x = 0, y = -1 },
    } do
        local x, y = p.x + dir.x, p.y + dir.y
        if 1 <= x and x <= width and 1 <= y and y <= height then
            table.insert(neis, { x = x, y = y })
        end
    end
    return neis
end
local function hash(p) return width * (p.y - 1) + (p.x - 1) end
local function unhash(h) return { x = h % width + 1, y = h // width + 1 } end
local function flood(p)
    local crop = farm[p.y][p.x]
    local filled, area = {}, 0
    local edges = { p }
    while #edges > 0 do
        area = area + 1
        local edge = table.remove(edges)
        farm[edge.y][edge.x] = nil
        filled[hash(edge)] = true
        for _, neighbor in ipairs(neighbors(edge)) do
            local h = hash(neighbor)
            if not filled[h] and farm[neighbor.y][neighbor.x] == crop then
                filled[h] = true
                table.insert(edges, neighbor)
            end
        end
    end
    local perimeter = 0
    for h, _ in pairs(filled) do
        local borders = 4
        for _, neighbor in ipairs(neighbors(unhash(h))) do
            if filled[hash(neighbor)] then borders = borders - 1 end
        end
        perimeter = perimeter + borders
    end
    return area * perimeter
end
local price = 0
for x = 1, width do
    for y = 1, height do
        if farm[y][x] then price = price + flood { x = x, y = y } end
    end
end
print(price)
