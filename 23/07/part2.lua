local hands = {}
for line in io.lines './input.txt' do
    local hand, bid = line:match '^(.+) (%d+)$'
    local counts, dups = {}, {}
    for card in hand:gmatch '.' do
        counts[card] = (counts[card] or 0) + 1
    end
    local jokers = counts['J'] or 0
    counts['J'] = nil
    local maxcard = 'K'
    for card, count in pairs(counts) do
        if count > (counts[maxcard] or 0) then maxcard = card end
    end
    counts[maxcard] = (counts[maxcard] or 0) + jokers
    for _, count in pairs(counts) do
        dups[count] = (dups[count] or 0) + 1
    end
    local kind
    if dups[1] == 5 then
        kind = 1
    elseif dups[1] == 3 and dups[2] == 1 then
        kind = 2
    elseif dups[1] == 1 and dups[2] == 2 then
        kind = 3
    elseif dups[1] == 2 and dups[3] == 1 then
        kind = 4
    elseif dups[2] == 1 and dups[3] == 1 then
        kind = 5
    elseif dups[1] == 1 and dups[4] == 1 then
        kind = 6
    elseif dups[5] == 1 then
        kind = 7
    end
    table.insert(hands, { kind = kind, hand = hand, bid = tonumber(bid) })
end
local allcards = 'J23456789TQKA'
table.sort(hands, function(hand1, hand2)
    if hand1.kind ~= hand2.kind then return hand1.kind < hand2.kind end
    for i = 1, 5 do
        local card1, card2 = hand1.hand:sub(i, i), hand2.hand:sub(i, i)
        local pos1, pos2 = allcards:find(card1), allcards:find(card2)
        if pos1 ~= pos2 then return pos1 < pos2 end
    end
    return false -- i have no idea why this happens
end)
local winnings = 0
for rank, hand in ipairs(hands) do
    winnings = winnings + rank * hand.bid
end
print(winnings)
