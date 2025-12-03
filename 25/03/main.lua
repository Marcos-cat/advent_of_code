local input = io.open('input.txt'):read 'a'

local function max_jolts(size, rating)
    local max_index = 0
    local jolts = 0
    for ignore = size - 1, 0, -1 do
        local max = 0
        for i = max_index + 1, #rating - ignore do
            local number = tonumber(string.sub(rating, i, i))
            if number > max then
                max = number
                max_index = i
            end
        end
        jolts = jolts * 10 + max
    end
    return jolts
end

local max2, max12 = 0, 0

for line in input:gmatch '[%d]+' do
    max2 = max2 + max_jolts(2, line)
    max12 = max12 + max_jolts(12, line)
end

print(max2)
print(max12)
