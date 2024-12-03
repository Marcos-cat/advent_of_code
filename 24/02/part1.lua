local safe = 0
for line in io.lines './input.txt' do
    local last, mindiff, maxdiff
    for num in line:gmatch '%d+' do
        if last then
            local diff = tonumber(num) - last
            mindiff = math.min(mindiff or diff, diff)
            maxdiff = math.max(maxdiff or diff, diff)
        end
        last = tonumber(num)
    end
    if (1 <= mindiff and maxdiff <= 3) or (-3 <= mindiff and maxdiff <= -1) then
        safe = safe + 1
    end
end
print(safe) -- 218
