local rules, reading, sum = {}, true, 0
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
                if (rules[page] or {})[other] then
                    i, ordered = j, false
                    break
                end
            end
            table.insert(pages, i, page)
        end
        if not ordered then
            sum = sum + tonumber(pages[math.ceil(#pages / 2)])
        end
    end
end
print(sum)
