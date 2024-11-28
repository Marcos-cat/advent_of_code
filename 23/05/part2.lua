local items, almanac = {}, {}
for line in io.lines './input.txt' do
    if line:match '^seeds:' then
        for min, len in line:gmatch '(%d+) (%d+)' do
            min, len = tonumber(min), tonumber(len)
            table.insert(items, { min = min, max = min + len - 1 })
        end
    elseif line:match '^[%a%-]+ map:' then
        table.insert(almanac, {})
    elseif line ~= '' then
        local dest, src, len = line:match '(%d+) (%d+) (%d+)'
        dest, src, len = tonumber(dest), tonumber(src), tonumber(len)
        table.insert(
            almanac[#almanac],
            { diff = dest - src, min = src, max = src + len - 1 }
        )
    end
end
for _, category in ipairs(almanac) do
    local production = {}
    for _, item in ipairs(items) do
        local mapped = false
        for _, map in ipairs(category) do
            if item.min < map.min and map.min <= item.max then
                table.insert(items, { min = item.min, max = map.min - 1 })
                item.min = map.min
            end
            if item.min <= map.max and map.max < item.max then
                table.insert(items, { min = map.max + 1, max = item.max })
                item.max = map.max
            end
            if map.min <= item.min and item.max <= map.max then
                item.min = item.min + map.diff
                item.max = item.max + map.diff
                table.insert(production, item)
                mapped = true
                break
            end
        end
        if not mapped then table.insert(production, item) end
    end
    items = production
end
local min = items[1].min
for _, item in ipairs(items) do
    min = math.min(min, item.min)
end
print(min) -- 31161857
