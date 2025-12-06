local input = io.open('input.txt'):read 'a'
local ranges_string, ids_string = string.match(input, '^(.*)\n\n(.*)$')

local ranges, ids = {}, {}
for first, last in ranges_string:gmatch '(%d+)-(%d+)' do
    table.insert(ranges, { first = tonumber(first), last = tonumber(last) })
end
for id in ids_string:gmatch '%d+' do
    table.insert(ids, tonumber(id))
end

table.sort(ranges, function(a, b) return a.first < b.first end)

local fresh_ids = 0
for _, id in ipairs(ids) do
    for _, range in ipairs(ranges) do
        if ranges.first > id then break end
        if id <= range.last then
            fresh_ids = fresh_ids + 1
            break
        end
    end
end
print(fresh_ids)

for i = #ranges - 1, 1, -1 do
    local a, b = ranges[i], ranges[i + 1]
    if b.first <= a.last then
        a.last = math.max(a.last, b.last)
        table.remove(ranges, i + 1)
    end
end

local all_fresh_ids = 0
for _, range in ipairs(ranges) do
    all_fresh_ids = all_fresh_ids + range.last - range.first + 1
end

print(all_fresh_ids)
