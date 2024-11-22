local sum = 0
for line in io.lines './input.txt' do
    local history = {}
    for data in line:gmatch '%-?%d+' do
        table.insert(history, tonumber(data))
    end
    for size = 2, #history do
        sum = sum + history[size - 1] * (-1) ^ size
        for i = #history, size, -1 do
            history[i] = history[i] - history[i - 1]
        end
    end
end
print(sum)
