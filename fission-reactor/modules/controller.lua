local monitor = peripheral.wrap("top")
local fission_reactor = peripheral.wrap("fissionReactorLogicAdapter_0")
local redstone_prot = peripheral.wrap("redstoneIntegrator_4")
local redstone_power = peripheral.wrap("redstoneIntegrator_5")

local temp_value = {
    reactor = {
        temp = 0,
        status = false,
    },
    protection = true,
}

while true do
    --main power
    --activate when fission reactor status false & redstone ON
    if fission_reactor.getStatus() == false and redstone_power.getInput("front") == true then
        fission_reactor.activate()
        print("Reactor activated")

        --scram when fission reactor status true & redstone OFF
    elseif fission_reactor.getStatus() == true and redstone_power.getInput("front") == false then
        fission_reactor.scram()
        print("Reactor scramed")
    end

    --if coolant percentage is 1% or bellow
    if fission_reactor.getCoolantFilledPercentage() <= 0.01 then
        fission_reactor.scram()
        print("Reactor coolant is too low  reactor scramed.")
    end

    --if used coolant percentage is 95% or higher
    if fission_reactor.getHeatedCoolantFilledPercentage() >= 0.95 then
        fission_reactor.scram()
        print("Reactor HeatedCoolant is too high  reactor scramed.")
    end

    -- if nuclear waste percentage is 95% or higher
    if fission_reactor.getWasteFilledPercentage() >= 0.95 then
        fission_reactor.scram()
        print("Reactor waste is too high  reactor scramed")
    end
end