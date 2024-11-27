local modules = {} ---@type table<string,{on?:boolean,type?:string,memory?:table<string,boolean>,dests:string[]}>
for line in io.lines './input.txt' do
    local module = {}
    local type, id, dests = line:match '^([&%%]?)(%a+) %-> ([%a, ]+)$'
    if type == '%' then
        module.on = false
    elseif type == '&' then
        module.memory = {}
    else
        type = nil
    end
    module.type = type
    module.dests = {}
    for dest in dests:gmatch '%a+' do
        table.insert(module.dests, dest)
    end
    modules[id] = module
end
for id, module in pairs(modules) do
    for _, dest in ipairs(module.dests) do
        if (modules[dest] or {}).type == '&' then
            modules[dest].memory[id] = false
        end
    end
end
local highs, lows = 0, 0
for _ = 1, 1000 do
    local pulses = { { from = 'button', to = 'broadcaster', ishigh = false } }
    while #pulses > 0 do
        local next = {}
        for _, pulse in ipairs(pulses) do
            if pulse.ishigh then
                highs = highs + 1
            else
                lows = lows + 1
            end
            local recv = modules[pulse.to]
            if recv then
                local function send(ishigh)
                    for _, dest in ipairs(recv.dests) do
                        table.insert(next, {
                            from = pulse.to,
                            to = dest,
                            ishigh = ishigh,
                        })
                    end
                end
                if recv.type == '%' then
                    if not pulse.ishigh then
                        recv.on = not recv.on
                        send(recv.on)
                    end
                elseif recv.type == '&' then
                    recv.memory[pulse.from] = pulse.ishigh
                    local allhigh = true
                    for _, high in pairs(recv.memory) do
                        if not high then allhigh = false end
                    end
                    send(not allhigh)
                else
                    send(pulse.ishigh)
                end
            end
        end
        pulses = next
    end
end
print(highs * lows)
