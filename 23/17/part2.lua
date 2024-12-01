local temperature = {}
for line in io.lines './input.txt' do
    local row = {}
    for d in line:gmatch '.' do
        table.insert(row, tonumber(d))
    end
    table.insert(temperature, row)
end
local width, height = #temperature[1], #temperature
local Heap = {}
function Heap.new(le)
    if not le then le = function(a, b) return a < b end end
    return setmetatable({ n = 0, tree = {}, le = le }, { __index = Heap })
end
function Heap:bubble(n)
    local tree = self.tree
    while true do
        local parent = math.floor(n / 2)
        if parent == 0 then break end
        if self.le(tree[n], tree[parent]) then
            tree[n], tree[parent] = tree[parent], tree[n]
            n = parent
        else
            break
        end
    end
end
function Heap:push(item)
    self.n = self.n + 1
    local n = self.n
    local tree = self.tree
    tree[n] = item
    self:bubble(n)
end
function Heap:pop()
    if self.n == 0 then return nil end
    local tree = self.tree
    local item = tree[1]
    if self.n == 1 then
        self.n = 0
        tree[1] = nil
        return item
    end
    self.n = self.n - 1
    local n = 1
    tree[n] = table.remove(tree)
    while true do
        local a, b = n * 2, n * 2 + 1
        if a > self.n then break end
        if not tree[b] then
            if self.le(tree[a], tree[n]) then
                tree[n], tree[a] = tree[a], tree[n]
            end
            break
        else
            local min = a
            if self.le(tree[b], tree[a]) then min = b end
            if self.le(tree[min], tree[n]) then
                tree[n], tree[min] = tree[min], tree[n]
                n = min
            else
                break
            end
        end
    end
    return item
end
local Node = {}
function Node.new(x, y, dir, steps)
    -- assert(steps >= 4)
    if steps > 10 or x < 1 or y < 1 or x > width or y > height then
        return nil
    end
    local new = { x = x, y = y, dir = dir, steps = steps }
    setmetatable(new, { __index = Node })
    return new
end
function Node:neighbors()
    local neighbors, costs = {}, {}
    local a, b = -1, 1
    if self.steps < 4 then
        a, b = 0, 0
    end
    for d = a, b do
        local dir = (self.dir + d) % 4
        local dx, dy = 0, 0
        if dir == 0 then
            dy = -1
        elseif dir == 1 then
            dx = 1
        elseif dir == 2 then
            dy = 1
        elseif dir == 3 then
            dx = -1
        end
        local steps = 1
        if d == 0 then steps = self.steps + 1 end
        local neighbor = Node.new(self.x + dx, self.y + dy, dir, steps)
        if neighbor then
            table.insert(neighbors, neighbor)
            table.insert(costs, temperature[neighbor.y][neighbor.x])
        end
    end
    return neighbors, costs
end
function Node:eq(other)
    return self.x == other.x
        and self.y == other.y
        and self.dir == other.dir
        and self.steps == other.steps
end
function Node:hash()
    return string.format('%03d%03d%d%d', self.x, self.y, self.dir, self.steps)
end
local function astar(start_nodes, done, neighbors, heuristic, eq)
    local function contains(node, list)
        for i, other in ipairs(list) do
            if eq(node, other) then return i end
        end
    end
    local open = Heap.new(
        function(a, b) return a.f < b.f or (a.f == b.f and a.h < b.h) end
    )
    local tree = open.tree
    for _, node in ipairs(start_nodes) do
        node.g = 0
        node.h = heuristic(node)
        node.f = node.g + node.h
        open:push(node)
    end
    local closed = {}
    local iters = 0
    while true do
        iters = iters + 1
        if iters % 1000 == 0 then print(iters) end
        local current = open:pop()
        if not current then break end
        if done(current) then return current.g end
        closed[current:hash()] = true
        local neighs, costs = neighbors(current)
        for j, neighbor in ipairs(neighs) do
            neighbor.g = current.g + costs[j]
            if not closed[neighbor:hash()] then
                local i = contains(neighbor, tree)
                if not i then
                    neighbor.h = heuristic(neighbor)
                    neighbor.f = neighbor.g + neighbor.h
                    open:push(neighbor)
                else
                    tree[i].g = math.min(neighbor.g, tree[i].g)
                    neighbor = tree[i]
                    neighbor.f = neighbor.g + neighbor.h
                    open:bubble(i)
                end
            end
        end
    end
end
print(
    astar(
        { Node.new(1, 1, 1, 0), Node.new(1, 1, 2, 0) },
        function(node)
            return node.x == width and node.y == height and node.steps >= 4
        end,
        Node.neighbors,
        function(node) return width - node.x + height - node.y end,
        Node.eq
    )
)
