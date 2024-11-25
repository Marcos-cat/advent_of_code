local count = 0
for line in io.lines './input.txt' do
    local grouping, total = {}, 0
    for num in line:gmatch '%d+' do
        num = tonumber(num)
        table.insert(grouping, num)
        total = total + num
    end
    local springs, counts = { '' }, { 0 }
    line = line:match '[%.?#]+'
    local size = #line
    for spring in line:gmatch '.' do
        if spring == '?' then
            for i = 1, #springs do
                if counts[i] < total then
                    if size - #springs[i] + counts[i] > total then
                        table.insert(springs, springs[i] .. '#')
                        table.insert(counts, counts[i] + 1)
                        springs[i] = springs[i] .. '.'
                    else
                        springs[i] = springs[i] .. '#'
                        counts[i] = counts[i] + 1
                    end
                else
                    springs[i] = springs[i] .. '.'
                end
            end
        else
            local broken = spring == '#'
            for i = 1, #springs do
                springs[i] = springs[i] .. spring
                if broken then counts[i] = counts[i] + 1 end
            end
        end
    end
    for _, spring in ipairs(springs) do
        local i, possible = 0, true
        for broken in spring:gmatch '#+' do
            i = i + 1
            if #broken ~= grouping[i] then
                possible = false
                break
            end
        end
        if possible and i == #grouping then count = count + 1 end
    end
end
print(count)
