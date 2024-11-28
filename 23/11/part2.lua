local y, galaxies, xs, ys = 1, {}, {}, {}
for line in io.lines './input.txt' do
    for x in line:gmatch '()#' do
        table.insert(galaxies, { x = x, y = y })
        xs[x], ys[y] = true, true
    end
    y = y + 1
end
local dist = 0
for a = 1, #galaxies do
    for b = a + 1, #galaxies do
        local xa, xb = galaxies[a].x, galaxies[b].x
        for xi = math.min(xa, xb) + 1, math.max(xa, xb) do
            dist = dist + (xs[xi] and 1 or 1000000)
        end
        local ya, yb = galaxies[a].y, galaxies[b].y
        for yi = math.min(ya, yb) + 1, math.max(ya, yb) do
            dist = dist + (ys[yi] and 1 or 1000000)
        end
    end
end
print(dist) -- 634324905172
