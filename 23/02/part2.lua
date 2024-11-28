local game, sum = 1, 0
for line in io.lines './input.txt' do
    local colors = {}
    for num, color in line:gmatch '(%d+) (%a+)' do
        colors[color] = math.max(colors[color] or 0, tonumber(num))
    end
    sum = sum + colors.red * colors.green * colors.blue
    game = game + 1
end
print(sum) -- 56580
