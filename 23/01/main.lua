local s = 0
for l in io.lines './input.txt' do
    local a, z
    for d in l:gmatch '%d' do
        a, z = a or d, d
    end
    s = s + a * 10 + z
end
print(s)

local words = {
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    '%d',
}

local sum = 0
for line in io.lines './input.txt' do
    local first, last, firsti, lasti
    for _, pat in ipairs(words) do
        for i, match in line:gmatch('()(' .. pat .. ')') do
            local num
            for n, word in ipairs(words) do
                if match == word then num = n end
            end
            num = num or tonumber(match)
            if not firsti or i < firsti then
                first, firsti = num, i
            end
            if not lasti or i > lasti then
                last, lasti = num, i
            end
        end
    end
    sum = sum + first * 10 + last
end
print(sum)
