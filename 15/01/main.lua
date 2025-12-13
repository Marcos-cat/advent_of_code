local floor = 0
local basement
for i, step in io.open('input.txt'):read('a'):gmatch '()([()])' do
    floor = floor + (step == '(' and 1 or -1)
    if not basement and floor < 0 then basement = i end
end
print(floor)
print(basement)
