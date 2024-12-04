local sum, enable = 0, true
for instr, a, b in
    io.open('./input.txt'):read('a'):gmatch "([muldon't]+)%((%d*),?(%d*)%)"
do
    if instr:match 'do$' then enable = true end
    if instr:match "don't$" then enable = false end
    if instr:match 'mul$' and enable then
        sum = sum + tonumber(a) * tonumber(b)
    end
end
print(sum) -- 80570939
