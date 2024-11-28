local sum = 0
for line in io.lines './input.txt' do
    local winstr, numstr = string.match(line, 'Card%s+%d+: (.+) | (.+)$')
    local wins = {}
    for win in string.gmatch(winstr, '%d+') do
        wins[win] = true
    end
    local score
    for num in string.gmatch(numstr, '%d+') do
        if wins[num] then
            score = score and score * 2 or 1
        end
    end
    sum = sum + (score or 0)
end
print(sum) -- 15205
