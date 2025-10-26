local environment = peripheral.wrap("top")
--Weather "right"
--Time "left"

while true do
    local DayLightLevel = environment.getDayLightLevel()

    --autoskip night
    -- RS ON
    if DayLightLevel <= 4 then
        redstone.setOutput("left",true)
    end

    --RS OFF
    if DayLightLevel >= 8 then
        redstone.setOutput("left",false)
    end

    --not Sunny or Thunder 
    --RS ON
    if (not environment.isSunny()) or (environment.isThunder() ) then
        redstone.setOutput("right",true)
    else
        redstone.setOutput("right",false)
    end
end