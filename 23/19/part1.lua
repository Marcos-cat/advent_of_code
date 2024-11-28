local workflows = {}
local file = io.open('./input.txt'):read 'a'
for name, rules in file:gmatch '(%a+){(.-)}' do
    local workflow = {}
    for category, comp, rating, result in
        rules:gmatch '([xmas])([><])(%d+):(%a+),'
    do
        table.insert(workflow, {
            category = category,
            comp = comp,
            rating = tonumber(rating),
            result = result,
        })
    end
    workflow.default = rules:match ',(%a+)$'
    workflows[name] = workflow
end
local function flow(part, workflow)
    workflow = workflow or workflows['in']
    local function result(next)
        if next == 'A' then return part.x + part.m + part.a + part.s end
        if next == 'R' then return 0 end
        return flow(part, workflows[next])
    end
    for _, rule in ipairs(workflow) do
        if rule.comp == '>' then
            if part[rule.category] > rule.rating then
                return result(rule.result)
            end
        elseif rule.comp == '<' then
            if part[rule.category] < rule.rating then
                return result(rule.result)
            end
        end
    end
    return result(workflow.default)
end
local sum = 0
for ratings in file:gmatch '{([xmas=%d,]-)}' do
    local part = {}
    for category, rating in ratings:gmatch '([xmas])=(%d+)' do
        part[category] = tonumber(rating)
    end
    sum = sum + flow(part)
end
print(sum) -- 342650
