local garden, start = {}
for line in io.lines './input.txt' do
    local row = {}
    table.insert(garden, row)
    for plot in line:gmatch '.' do
        if plot == '#' then
            table.insert(row, true)
        elseif plot == 'S' then
            table.insert(row, 1)
            start = { x = #row, y = #garden }
        else
            table.insert(row, false)
        end
    end
end
local width, height = #garden[1], #garden
local steppers, nexts = { start }, {}
for _ = 1, 64 do
    while #steppers > 0 do
        local stepper = table.remove(steppers)
        local x, y = stepper.x, stepper.y
        for _, neighbor in ipairs {
            { x = x + 1, y = y },
            { x = x - 1, y = y },
            { x = x, y = y + 1 },
            { x = x, y = y - 1 },
        } do
            local nx, ny = neighbor.x, neighbor.y
            if 1 <= nx and nx <= width and 1 <= ny and ny <= height then
                if not garden[ny][nx] then
                    table.insert(nexts, neighbor)
                    garden[ny][nx] = 1
                end
            end
        end
    end
    steppers, nexts = nexts, steppers
end
local plots = 0
for x, row in ipairs(garden) do
    for y, plot in ipairs(row) do
        if plot == 1 and (x + y) % 2 == (start.x + start.y) % 2 then
            plots = plots + 1
        end
    end
end
print(plots) -- 3853
