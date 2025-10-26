local monitor = peripheral.find("monitor")
local INputNames = {
    "fission-reactor",
    "fusion-reactor",
    "solar-gen",
    "other",
    "",
    "",
    "",
    ""
} --35-42
local OUTputNames = {
    "AE controller",
    "Network1",
    "SPS",
    "ore multiplier",
    "SUB-battery",
    "",
    "",
    ""
}
local Input_peripheral_offset = 35;
local Output_peripheral_offset = 0;

local monitorX, monitorY = monitor.getSize()
local monitorX_half = math.floor(monitorX / 2)

--[[
local function getDigitCount(num)
    -- number to string
    local numStr = tostring(math.abs(num))
    -- remove period
    numStr = numStr:gsub("%.", "")
    -- return string length
    return #numStr
end
]]
local function getDigitCount(num)
    -- number to string
    local numStr = tostring(math.abs(num))
    -- find the position of the period
    local periodPos = numStr:find("%.")
    -- if there is a period, ignore everything after it
    if periodPos then
        numStr = numStr:sub(1, periodPos - 1)
    end
    -- return string length
    return #numStr
end

local function ShortNumber(Number)
    local DigitCount = getDigitCount(Number)

    --
    if DigitCount < 4 then
        local Num = Number
        return Num .. "FE/t"
        --k
    elseif DigitCount < 7 then
        local Num = math.floor(Number / 1) / 1000
        return Num .. "kFE/t"
        --M 12
    elseif DigitCount < 10 then
        local Num = math.floor(Number / 10 ^ 3) / 1000
        return Num .. "MFE/t"

        --G 16
    elseif DigitCount < 13 then
        local Num = math.floor(Number / 10 ^ 6) / 1000
        return Num .. "GFE/t"

        --T 20
    elseif DigitCount < 16 then
        local Num = math.floor(Number / 10 ^ 9) / 1000
        return Num .. "TFE/t"

        --P 24
    elseif DigitCount < 19 then
        local Num = math.floor(Number / 10 ^ 12) / 1000
        return Num .. "PFE/t"

        --E 28
    elseif DigitCount < 22 then
        local Num = math.floor(Number / 10 ^ 15) / 1000
        return Num .. "EFE/t"
    end
end

while true do
    --OUT Detector loop
    for OUTcount = 0, 7, 1 do
        local EnergyDetector = peripheral.wrap("energyDetector_" .. Output_peripheral_offset + OUTcount)
        local FE_t = EnergyDetector.getTransferRate()
        local count = (OUTcount + 1) + OUTcount
        local OUTputName = OUTputNames[OUTcount + 1]

        -- without 0
        if string.len(OUTputName) > 0 then
            monitor.setCursorPos(monitorX_half, count)
            monitor.write(OUTputName)

            monitor.setCursorPos(monitorX_half, count + 1)
            --monitor.write(FE_t .. " FE/t")
            monitor.write(ShortNumber(FE_t))
        end


        --print("OUTPUT: " .. EnergyDetector.getTransferRate())
        --print(count)
        --print(count + 1)
    end

    --in Detector loop
    for INcount = 0, 7, 1 do
        local EnergyDetector = peripheral.wrap("energyDetector_" .. Input_peripheral_offset + INcount)
        local FE_t = EnergyDetector.getTransferRate()
        local count = (INcount + 1) + INcount
        local INputName = INputNames[INcount + 1]

        -- without 0
        if string.len(INputName) > 0 then
            monitor.setCursorPos(1, count)
            monitor.write(INputName)

            monitor.setCursorPos(1, count + 1)
            --monitor.write(FE_t .. " FE/t")
            monitor.write(ShortNumber(FE_t))
        end


        --print("INPUT: " .. EnergyDetector.getTransferRate())
        --print(count)
    end

    --total

    --total using
    local total_output = 0
    for i = 0, 7, 1 do
        total_output = total_output + peripheral.wrap("energyDetector_" .. Output_peripheral_offset + i).getTransferRate()
        print(peripheral.wrap("energyDetector_" .. i).getTransferRate())
    end
    monitor.setCursorPos(monitorX_half, monitorY - 4)
    monitor.write("Using")
    monitor.setCursorPos(monitorX_half, monitorY - 3)
    --monitor.write(total_output .. " FE/t")
    monitor.write(ShortNumber(total_output))

    --total gen
    local total_input = 0
    for i = 0, 7, 1 do
        total_input = total_input + peripheral.wrap("energyDetector_" .. Input_peripheral_offset + i).getTransferRate()
    end
    monitor.setCursorPos(1, monitorY - 4)
    monitor.write("Generating")
    monitor.setCursorPos(1, monitorY - 3)
    --monitor.write(total_input .. " FE/t")
    monitor.write(ShortNumber(total_input))

    --p/l
    local monitorX_half_1 = math.floor(monitorX / 3)
    monitor.setCursorPos(monitorX_half_1, monitorY - 2)
    monitor.write("Producing/Using")
    monitor.setCursorPos(monitorX_half_1, monitorY - 1)

    local PL_Rate = total_input - total_output
    local PL = ""

    --Rate > 0
    if PL_Rate > 0 then
        PL = "+"
        monitor.setTextColor(colors.lime)
    elseif PL_Rate < 0 then
        PL = ""
        monitor.setTextColor(colors.red)
    else
        PL = ""
        monitor.setTextColor(colors.white)
    end
    --monitor.write(PL .. PL_Rate .. " FE/t")
    monitor.write(PL .. ShortNumber(PL_Rate))
    monitor.setTextColor(colors.white)

    os.sleep(60)
    monitor.clear()
end
