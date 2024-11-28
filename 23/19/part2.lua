local workflows = {}
for name, rules in io.open('./input.txt'):read('a'):gmatch '(%a+){(.-)}' do
    local workflow = {}
    for xmas, comp, rating, result in rules:gmatch '([xmas])([><])(%d+):(%a+),' do
        table.insert(workflow, {
            xmas = xmas,
            comp = comp,
            rating = tonumber(rating),
            result = result,
        })
    end
    workflow.default = rules:match ',(%a+)$'
    workflows[name] = workflow
end
local function copy(part)
    local new = {}
    for xmas, range in pairs(part) do
        new[xmas] = { min = range.min, max = range.max }
    end
    return new
end
local flow
local function result(new, next)
    if next == 'A' then
        local prod = 1
        for _, range in pairs(new) do
            prod = prod * (range.max - range.min + 1)
        end
        return prod
    elseif next == 'R' then
        return 0
    else
        return flow(new, workflows[next])
    end
end
function flow(part, workflow)
    local others = 0
    for _, rule in ipairs(workflow) do
        local xmas, rating = rule.xmas, rule.rating
        local range = part[xmas]
        if rule.comp == '>' then
            if range.min > rating then
                return others + result(part, rule.result)
            elseif range.max > rating then
                local other = copy(part)
                other[xmas].min = rating + 1
                part[xmas].max = rating
                others = others + result(other, rule.result)
            end
        elseif rule.comp == '<' then
            if range.max < rating then
                return others + result(part, rule.result)
            elseif range.min < rating then
                local other = copy(part)
                other[xmas].max = rating - 1
                part[xmas].min = rating
                others = others + result(other, rule.result)
            end
        end
    end
    return others + result(part, workflow.default)
end
local part = {}
for xmas in ('xmas'):gmatch '.' do
    part[xmas] = { min = 1, max = 4000 }
end
print(string.format('%d', flow(part, workflows['in']))) -- 130303473508222
