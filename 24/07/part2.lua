local sum = 0
for line in io.lines './input.txt' do
    local values = {}
    for value in line:gmatch '%d+' do
        table.insert(values, tonumber(value))
    end
    local test = table.remove(values, 1)
    local results = { table.remove(values, 1) }
    for _, value in ipairs(values) do
        for i = 1, #results do
            table.insert(results, results[i] * value)
            table.insert(results, tonumber(results[i] .. value))
            results[i] = results[i] + value
        end
    end
    for _, result in ipairs(results) do
        if result == test then
            sum = sum + test
            break
        end
    end
end
print(string.format('%u', sum))
