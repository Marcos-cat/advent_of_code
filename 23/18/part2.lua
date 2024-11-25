local points, perimeter = { { x = 0, y = 0 } }, 0
for line in io.lines './input.txt' do
    local len, dir = line:match '%(#(%x-)([0-3])%)$'
    len, dir = tonumber(len, 16), tonumber(dir)
    local point = { x = points[#points].x, y = points[#points].y }
    perimeter = perimeter + len
    if dir == 0 then
        point.x = point.x + len
    elseif dir == 1 then
        point.y = point.y + len
    elseif dir == 2 then
        point.x = point.x - len
    elseif dir == 3 then
        point.y = point.y - len
    end
    table.insert(points, point)
end
local area = 0
for i = 1, #points - 1 do -- Shoelace formula!!!
    area = area
        + (points[i].y + points[i + 1].y) * (points[i].x - points[i + 1].x)
end
print(math.abs(area) / 2 + perimeter / 2 + 1)
