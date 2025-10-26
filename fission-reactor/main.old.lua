local monitor = peripheral.wrap("top")
local fission_reactor = peripheral.wrap("fissionReactorLogicAdapter_0")
local redstone_prot = peripheral.wrap("redstoneIntegrator_4")
local redstone_power = peripheral.wrap("redstoneIntegrator_5")

local name = "fission reactor status"

monitor.setCursorPos((monitor.getSize() / 2) - (math.floor(#name / 2)), 1)
monitor.setTextScale(1)
monitor.write(name)


--Enable Disable Color
function TF_Color(bool)
    if bool == true then
        return colors.green
    elseif bool == false then
        return colors.red
    end
end

local protection = true

local temp_value = {
    0,     -- reactor temp
    false, -- reactor status
    true,  --protection
}
while true do
    --input
    --protection
    if redstone_prot.getInput("front") then
        protection = not (protection)
    end

    --main power
    --activate when fission reactor status false & redstone ON
    if fission_reactor.getStatus() == false and redstone_power.getInput("front") == true then
        fission_reactor.activate()

        --scram when fission reactor status true & redstone OFF
    elseif fission_reactor.getStatus() == true and redstone_power.getInput("front") == false then
        fission_reactor.scram()
    end

    if (temp_value[1] ~= fission_reactor.getStatus())then
        
    end

    --temperature
    local temp = math.floor((fission_reactor.getTemperature() - 273.15) * 100) / 100
    monitor.setCursorPos(1, 2)
    --monitor.clearLine()
    monitor.write(temp .. "C")

    --reactor stats
    -- (boolean) and (true) or (false)
    local Reactor_status = fission_reactor.getStatus() and "Active" or "Disabled"
    monitor.setBackgroundColor(TF_Color(not (fission_reactor.getStatus()))) --setbackground color
    monitor.setCursorPos(math.floor(monitor.getSize() / 3), 2)
    monitor.write(Reactor_status)
    monitor.setBackgroundColor(colors.black)

    --reactor protection status
    local Protection_status = protection and "Enabled" or "Disabled"
    monitor.setBackgroundColor(TF_Color(protection)) --setbackground color
    monitor.setCursorPos(math.floor((monitor.getSize() / 3) * 2), 2)
    monitor.write(Protection_status)
    monitor.setBackgroundColor(colors.black)


    sleep(1)
end
