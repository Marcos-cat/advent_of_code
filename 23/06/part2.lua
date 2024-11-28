local time
for line in io.lines './input.txt' do
    local num = ''
    for n in line:gmatch '%d+' do
        num = num .. n
    end
    if not time then
        time = num
    else
        local disc = math.sqrt(time ^ 2 - 4 * num)
        local max, min = (time + disc) / 2, (time - disc) / 2
        print(math.ceil(max) - 1 - math.floor(min)) -- 23501589
    end
end
