local rules, reading, sum = {}, true, 0
for line in io.lines './input.txt' do
    if line == '' then
        reading = false
    elseif reading then
        local before, after = line:match '^(.+)|(.+)$'
        rules[before] = rules[before] or {}
        rules[before][after] = true
    else
        local pages = {}
        for page in line:gmatch '[^,]+' do
            for _, other in ipairs(pages) do
                if rules[page][other] then goto unordered end
            end
            table.insert(pages, page)
        end
        sum = sum + tonumber(pages[math.ceil(#pages / 2)])
        ::unordered::
    end
end
print(sum)
