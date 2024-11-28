local pattern, sum = {}, 0
for line in io.lines './input.txt' do
    if #line == 0 then
        local width, height = #pattern[1], #pattern
        for reflection = 1, height - 1 do
            for y = math.max(1, 2 * reflection + 1 - height), reflection do
                local yprime = 2 * reflection - y + 1
                for x = 1, width do
                    if pattern[y][x] ~= pattern[yprime][x] then goto fail end
                end
            end
            sum = sum + reflection * 100
            ::fail::
        end
        for reflection = 1, width - 1 do
            for x = math.max(1, 2 * reflection + 1 - width), reflection do
                local xprime = 2 * reflection - x + 1
                for y = 1, height do
                    if pattern[y][x] ~= pattern[y][xprime] then goto fail end
                end
            end
            sum = sum + reflection
            ::fail::
        end
        pattern = {}
    else
        local row = {}
        for rock in line:gmatch '.' do
            table.insert(row, rock == '#')
        end
        table.insert(pattern, row)
    end
end
print(sum) -- 36448
