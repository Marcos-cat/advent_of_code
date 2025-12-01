local map, dirs = io.open('./sample3.txt'):read('a'):match '(.+)\n\n(.+)'
local boxes, x, y = {}, 0, 0
for c in map:gmatch '.' do
    if c == '\n' then
        x, y = 0, y + 1
        elseif c=='#' then
        
    end
end
