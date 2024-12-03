local safe = 0
for line in io.lines './input.txt' do
    local report = {}
    for level in line:gmatch '%d+' do
        table.insert(report, tonumber(level))
    end
    for skip = 1, #report do
        local last, mindiff, maxdiff
        for i, num in ipairs(report) do
            if i ~= skip then
                if last then
                    local diff = num - last
                    mindiff = math.min(mindiff or diff, diff)
                    maxdiff = math.max(maxdiff or diff, diff)
                end
                last = num
            end
        end
        if
            (1 <= mindiff and maxdiff <= 3) or (-3 <= mindiff and maxdiff <= -1)
        then
            safe = safe + 1
            break
        end
    end
end
print(safe) -- 290
