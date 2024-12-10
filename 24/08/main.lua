local antennae, grid = {}, {}
local height, width = 0, nil
for line in io.lines './input.txt' do
    height, width = height + 1, #line
    local row = {}
    for _ = 1, width do
        table.insert(row, false)
    end
    table.insert(grid, row)
    for x, node in line:gmatch '()(%w)' do
        antennae[node] = antennae[node] or {}
        table.insert(antennae[node], { x = x, y = height })
    end
end
local function find(n, v)
    for _, nodes in pairs(antennae) do
        for i, a in ipairs(nodes) do
            for j = i + 1, #nodes do
                local b = nodes[j]
                local dx, dy = a.x - b.x, a.y - b.y
                local ax, ay = a.x + n * dx, a.y + n * dy
                local bx, by = b.x - n * dx, b.y - n * dy
                if 1 <= ax and ax <= width and 1 <= ay and ay <= height then
                    grid[ay][ax] = v
                end
                if 1 <= bx and bx <= width and 1 <= by and by <= height then
                    grid[by][bx] = v
                end
            end
        end
    end
end
for n = -width, width do
    find(n, true)
end
find(1, 1)
local part1, part2 = 0, 0
for _, row in ipairs(grid) do
    for _, b in ipairs(row) do
        if b == 1 then part1 = part1 + 1 end
        if b then part2 = part2 + 1 end
    end
end
print(part1, part2)
