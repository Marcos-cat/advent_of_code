local instrs, nodes = '', {}
for line in io.lines './input.txt' do
    if line:match '^[LR]+$' then
        instrs = line
    elseif line ~= '' then
        local node, left, right = line:match '^(...) = %((...), (...)%)$'
        nodes[node] = { L = left, R = right }
    end
end
local steps, curr = 0, 'AAA'
while curr ~= 'ZZZ' do
    local i = steps % #instrs + 1
    curr = nodes[curr][instrs:sub(i, i)]
    steps = steps + 1
end
print(steps) -- 14429
