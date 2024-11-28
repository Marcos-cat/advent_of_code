local sum, cards = 0, {}
for line in io.lines './input.txt' do
    local card, winstr, numstr = line:match '^%D+(%d+):(.+)|(.+)$'
    card = tonumber(card)
    cards[card] = cards[card] or 1
    sum = sum + cards[card]
    local wins = {}
    for win in winstr:gmatch '%d+' do
        wins[win] = true
    end
    local matches = 0
    for num in numstr:gmatch '%d+' do
        if wins[num] then matches = matches + 1 end
    end
    for i = card + 1, card + matches do
        cards[i] = (cards[i] or 1) + cards[card]
    end
end
print(sum) -- 6189740
