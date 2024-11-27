local game, sum = 1, 0
for line in io.lines './input.txt' do
    local colors = {}
    for num, color in line:gmatch '(%d+) (%a+)' do
        colors[color] = math.max(colors[color] or 0, tonumber(num))
    end
    if colors.red <= 12 and colors.green <= 13 and colors.blue <= 14 then
        sum = sum + game
    end
    game = game + 1
end
print(sum)
