local sum = 0
for line in io.lines './input.txt' do
    local first, last
    for digit in line:gmatch '%d' do
        first, last = first or digit, digit
    end
    sum = sum + first * 10 + last
end
print(sum)
