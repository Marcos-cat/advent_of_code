local pattern, sum = {}, 0
for line in io.lines './input.txt' do
    if #line == 0 then
        local width, height = #pattern[1], #pattern
        for reflection = 1, height - 1 do
            local smudges = 0
            for y = math.max(1, 2 * reflection + 1 - height), reflection do
                local yprime = 2 * reflection - y + 1
                for x = 1, width do
                    if pattern[y][x] ~= pattern[yprime][x] then
                        smudges = smudges + 1
                    end
                end
            end
            if smudges == 1 then sum = sum + reflection * 100 end
        end
        for reflection = 1, width - 1 do
            local smudges = 0
            for x = math.max(1, 2 * reflection + 1 - width), reflection do
                local xprime = 2 * reflection - x + 1
                for y = 1, height do
                    if pattern[y][x] ~= pattern[y][xprime] then
                        smudges = smudges + 1
                    end
                end
            end
            if smudges == 1 then sum = sum + reflection end
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
print(sum) -- 35799
