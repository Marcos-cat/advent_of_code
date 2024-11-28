local instrs, map, nodes = '', {}, {}
for line in io.lines './input.txt' do
    if line:match '^[LR]+$' then
        instrs = line
    elseif line ~= '' then
        local node, left, right = line:match '^(...) = %((...), (...)%)$'
        map[node] = { L = left, R = right }
        if node:sub(-1) == 'A' then table.insert(nodes, node) end
    end
end
local totalsteps = 1
for _, node in ipairs(nodes) do
    local steps = 0
    while node:sub(-1) ~= 'Z' do
        local diri = steps % #instrs + 1
        node = map[node][instrs:sub(diri, diri)]
        steps = steps + 1
    end
    local gcd, b = totalsteps, steps
    repeat
        gcd, b = b, gcd % b
    until b == 0
    totalsteps = (steps * totalsteps) / gcd
end
print(totalsteps) -- 10921547990923
