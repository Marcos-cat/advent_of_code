local sum = 0
for line in io.lines './input.txt' do
    local history = {}
    for data in line:gmatch '%-?%d+' do
        table.insert(history, tonumber(data))
    end
    for size = #history - 1, 1, -1 do
        sum = sum + history[size + 1]
        for i = 1, size do
            history[i] = history[i + 1] - history[i]
        end
    end
end
print(sum) -- 2005352194
