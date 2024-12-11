local stones, counts = {}, {}
for stone in io.open('./input.txt'):read('a'):gmatch '%d+' do
    table.insert(stones, tonumber(stone))
    table.insert(counts, 1)
end
for _ = 1, 75 do
    local dups, nstones, ncounts = {}, {}, {}
    local function insert(stone, count)
        local i = dups[stone]
        if i then
            ncounts[i] = ncounts[i] + count
        else
            table.insert(nstones, stone)
            table.insert(ncounts, count)
            dups[stone] = #nstones
        end
    end
    for i = 1, #stones do
        local stone, count = stones[i], counts[i]
        local exp = math.floor(1 + math.log(stone, 10))
        if stone == 0 then
            insert(1, count)
        elseif exp % 2 == 0 then
            local factor = 10 ^ (exp / 2)
            insert(stone // factor, count)
            insert(stone % factor, count)
        else
            insert(stone * 2024, count)
        end
    end
    stones, counts = nstones, ncounts
end
local total = 0
for _, count in ipairs(counts) do
    total = total + count
end
print(total)
