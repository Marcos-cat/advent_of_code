local sum = 0
for step in io.open('./input.txt'):read():gmatch '[^,]+' do
    local hash = 0
    for c in step:gmatch '.' do
        hash = (hash + c:byte()) * 17 % 256
    end
    sum = sum + hash
end
print(sum) -- 510013
