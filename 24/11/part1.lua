local stones = {}
for stone in io.open('./input.txt'):read('a'):gmatch '%d+' do
    table.insert(stones, tonumber(stone))
end
for _ = 1, 25 do
    local nexts = {}
    for _, stone in ipairs(stones) do
        local exp = math.floor(1 + math.log(stone, 10))
        if stone == 0 then
            table.insert(nexts, 1)
        elseif exp % 2 == 0 then
            local factor = 10 ^ (exp / 2)
            table.insert(nexts, stone // factor)
            table.insert(nexts, stone % factor)
        else
            table.insert(nexts, stone * 2024)
        end
    end
    stones = nexts
end
print(#stones)
