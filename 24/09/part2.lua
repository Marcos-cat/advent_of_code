local file = io.open('./input.txt'):read 'a'
local disk = {}
local currfileid, onfile = 0, true
for d in file:gmatch '%d' do
    local size = tonumber(d)
    if onfile then
        table.insert(disk, { fileid = currfileid, size = size })
        currfileid = currfileid + 1
    else
        table.insert(disk, { size = size })
    end
    onfile = not onfile
end
local i = #disk
while i >= 1 do
    local fileid, size = disk[i].fileid, disk[i].size
    if fileid then
        for j = 1, i do
            if not disk[j].fileid and disk[j].size >= size then
                if disk[j].size == size then
                    disk[j], disk[i] = disk[i], disk[j]
                else
                    disk[j].size = disk[j].size - size
                    disk[i].fileid = nil
                    table.insert(disk, j, { fileid = fileid, size = size })
                    i = i + 1
                end
                break
            end
        end
    end
    i = i - 1
end
local checksum, pos = 0, 0
for _, spot in ipairs(disk) do
    local fileid = spot.fileid
    if fileid then
        for _ = 1, spot.size do
            checksum = checksum + pos * fileid
            pos = pos + 1
        end
    else
        pos = pos + spot.size
    end
end
print(checksum)
