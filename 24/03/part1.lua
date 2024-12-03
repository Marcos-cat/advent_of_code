local sum = 0
for a, b in io.open('./input.txt'):read('a'):gmatch 'mul%((%d+),(%d+)%)' do
    sum = sum + tonumber(a) * tonumber(b)
end
print(sum) -- 179834255
