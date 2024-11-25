local boxes = {}
for i = 0, 255 do
    boxes[i] = {}
end
for label, focallen in io.open('./input.txt'):read():gmatch '(%a+)[=-](%d*)' do
    local hash = 0
    for c in label:gmatch '.' do
        hash = (hash + c:byte()) * 17 % 256
    end
    focallen = tonumber(focallen)
    local box = boxes[hash]
    if focallen then
        if box[label] then
            box[box[label]] = focallen
        else
            table.insert(box, focallen)
            box[label] = #box
        end
    elseif box[label] then
        table.remove(box, box[label])
        for k, v in pairs(box) do
            if type(k) == 'string' and v > box[label] then box[k] = v - 1 end
        end
        box[label] = nil
    end
end
local focuspower = 0
for i, box in pairs(boxes) do
    for slot, focallen in ipairs(box) do
        focuspower = focuspower + (i + 1) * slot * focallen
    end
end
print(focuspower)
