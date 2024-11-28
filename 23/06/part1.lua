local times, prod = {}, 1
for line in io.lines './input.txt' do
    for num in line:gmatch '%d+' do
        if line:find '^Time: ' then
            table.insert(times, num)
        else
            local t = table.remove(times, 1)
            local disc = math.sqrt(t ^ 2 - 4 * num)
            local max, min = (t + disc) / 2, (t - disc) / 2
            prod = prod * (math.ceil(max) - 1 - math.floor(min))
        end
    end
end
print(prod) -- 1083852
