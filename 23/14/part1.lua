local cols, row = {}, 0
for line in io.lines './input.txt' do
    row = row + 1
    if row == 1 then
        for _ = 1, #line do
            table.insert(cols, { [0] = '#' })
        end
    end
    for col in line:gmatch '()#' do
        cols[col][row] = '#'
    end
    for col in line:gmatch '()O' do
        for i = row - 1, 0, -1 do
            if cols[col][i] then
                cols[col][i + 1] = 'O'
                break
            end
        end
    end
end
local load = 0
for _, col in ipairs(cols) do
    for i, rock in pairs(col) do
        if rock == 'O' then load = load + row - i + 1 end
    end
end
print(load)
