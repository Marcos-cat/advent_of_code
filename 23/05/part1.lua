local seeds, maps = {}, {}
for line in io.lines './input.txt' do
    if line:match '^seeds:' then
        for num in line:gmatch '%d+' do
            table.insert(seeds, tonumber(num))
        end
    elseif line:match '^[%a%-]+ map:' then
        table.insert(maps, {})
    else
        local dest, src, len = line:match '(%d+) (%d+) (%d+)'
        dest, src, len = tonumber(dest), tonumber(src), tonumber(len)
        if dest and src and len then
            table.insert(
                maps[#maps],
                { diff = dest - src, start = src, stop = src + len - 1 }
            )
        end
    end
end
for _, map in ipairs(maps) do
    for i, seed in ipairs(seeds) do
        for _, instr in ipairs(map) do
            if instr.start <= seed and seed <= instr.stop then
                seeds[i] = seed + instr.diff
                break
            end
        end
    end
end
local min = seeds[1]
for _, seed in ipairs(seeds) do
    min = math.min(min, seed)
end
print(min)
