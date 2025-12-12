local start = os.clock()

local connections = {}

for line in io.lines 'input.txt' do
    local node, outs = string.match(line, '^(.*): (.*)$')
    connections[node] = {}
    for out_node in outs:gmatch '%l%l%l' do
        table.insert(connections[node], out_node)
    end
end

local paths_cache = {}
local function paths(node, target)
    local cache = paths_cache[node .. target]
    if cache then return cache end

    local paths_count = 0
    for _, out_node in ipairs(connections[node]) do
        if out_node == target then
            paths_count = paths_count + 1
        elseif out_node ~= 'out' then
            paths_count = paths_count + paths(out_node, target)
        end
    end

    paths_cache[node .. target] = paths_count
    return paths_count
end

print(paths('you', 'out'))
print(paths('svr', 'fft') * paths('fft', 'dac') * paths('dac', 'out'))

print(os.clock() - start)
