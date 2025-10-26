local PlayerDetect = peripheral.wrap("playerDetector_0")
local Monitor = peripheral.find("monitor")


while true do
    --get Player Pos
    --online players
    local Players = PlayerDetect.getOnlinePlayers()

    for key, PlayerName in pairs(Players) do
        local GetPlayer = PlayerDetect.getPlayerPos(PlayerName)
        --print(("PlayerName: %s"):format(PlayerName))
        --print("X: " .. PlayerX)
        --print("Y: " .. PlayerY)
        --print("Z: " .. PlayerZ)

        Monitor.setCursorPos(1, 1)
        Monitor.write("PlayerName: " .. PlayerName)
        Monitor.setCursorPos(1, 2)
        Monitor.write("Health: " .. GetPlayer.health)
        Monitor.setCursorPos(1, 3)
        Monitor.write("X: " .. GetPlayer.x)
        Monitor.setCursorPos(1, 4)
        Monitor.write("Y: " .. GetPlayer.y)
        Monitor.setCursorPos(1, 5)
        Monitor.write("Z: " .. GetPlayer.z)
    end
end
