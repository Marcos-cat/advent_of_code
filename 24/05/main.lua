local rules, reading, part1, part2 = {}, true, 0, 0
for line in io.lines './input.txt' do
    if line == '' then
        reading = false
    elseif reading then
        local before, after = line:match '^(.+)|(.+)$'
        rules[before] = rules[before] or {}
        rules[before][after] = true
    else
        local pages, ordered = {}, true
        for page in line:gmatch '[^,]+' do
            local i = #pages + 1
            for j, other in ipairs(pages) do
                if rules[page][other] then
                    i, ordered = j, false
                    break
                end
            end
            table.insert(pages, i, page)
        end
        local middle = tonumber(pages[(#pages + 1) / 2])
        if ordered then
            part1 = part1 + middle
        else
            part2 = part2 + middle
        end
    end
end
print(part1, part2) -- 4905 6204
