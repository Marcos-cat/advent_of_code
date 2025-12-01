local input = io.open('input.txt'):read 'a'

local tick = 50
local landed_zero, passed_zero = 0, 0

for direction, ticks in input:gmatch '([RL])(%d+)' do
    direction = direction == 'R' and 1 or -1
    for _ = 1, ticks do
        tick = (tick + direction) % 100
        if tick == 0 then passed_zero = passed_zero + 1 end
    end
    if tick == 0 then landed_zero = landed_zero + 1 end
end

print(landed_zero)
print(passed_zero)
