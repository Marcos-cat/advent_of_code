local file = io.open('./input.txt'):read 'a'
local disk, disksize = {}, 0
local fileid, onfile = 0, true
for d in file:gmatch '%d' do
    local insert = nil
    if onfile then
        insert = fileid
        fileid = fileid + 1
    end
    for _ = 1, tonumber(d) do
        disksize = disksize + 1
        disk[disksize] = insert
    end
    onfile = not onfile
end
local empty = 1
for i = disksize, 1, -1 do
    for j = empty, i do
        if disk[j] == nil then
            disk[j], disk[i] = disk[i], disk[j]
            empty = j
            break
        end
    end
end
local checksum = 0
for pos, id in ipairs(disk) do
    checksum = checksum + (pos - 1) * id
end
print(checksum) -- 6421128769094
