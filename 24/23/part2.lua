local Set = {}
Set._mt = {
    __len = function(set) return set._len end,
    __pairs = function(set) return pairs(set.__items) end,
    __index = Set,
}
function Set.new()
    local set = { _len = 0, _items = {} }
    return setmetatable(set, Set._mt)
end
function Set:contains(item) return self._items[item] end
function Set:push(item)
    local entry = self._items[item]
    if not entry then self._len = self._len + 1 end
    self._items[item] = true
end
function Set:pop(item)
    local entry = self._items[item]
    if entry then self._len = self._len - 1 end
    self._items[item] = nil
    return entry
end
function Set:copy()
    local new = Set.new()
    new._len = self._len
    for k, v in pairs(self._items) do
        new._items[k] = v
    end
    return new
end
function Set:intersect(other)
    local intersect = Set.new()
    for k, _ in pairs(self._items) do
        if other:contains(k) then intersect:push(k) end
    end
    return intersect
end

local nodes = Set.new()

local graph = {}
for line in io.lines './input.txt' do
    local a, b = line:match '(.+)%-(.+)'
    if not graph[a] then graph[a] = Set.new() end
    if not graph[b] then graph[b] = Set.new() end
    graph[a]:push(b)
    graph[b]:push(a)
    nodes:push(a)
    nodes:push(b)
end

local max = {}
local function bk1(r, p, x)
    if #p == 0 and #x == 0 then
        if #max < #r then max = r end
    end
    for v, _ in pairs(p._items) do
        local a = r:copy()
        a:push(v)
        local n = graph[v]
        bk1(a, p:intersect(n), x:intersect(n))
        p:pop(v)
        x:push(v)
    end
end

bk1(Set.new(), nodes, Set.new())

local items = {}
for k, _ in pairs(max._items) do
    table.insert(items, k)
end
table.sort(items)
print(table.concat(items, ','))
