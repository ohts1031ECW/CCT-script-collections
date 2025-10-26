local PlayerDetector = peripheral.wrap("back")


term.clear()
while true do
    
    sleep(1)
    --get Player Pos
    --online players
    local Players = PlayerDetector.getOnlinePlayers()
    local termX , termY  =term.getSize()
    local termX_half = termX/ 2
    --local PlayerCount = 0
    for key, PlayerName in pairs(Players) do
        local GetPlayer = PlayerDetector.getPlayer(PlayerName)
        --term.clearLine()
        term.setCursorPos(1,key)
        print(PlayerName .. " ")
        term.setCursorPos(termX_half,key)
        print(GetPlayer.x .. "," .. GetPlayer.y .. "," .. GetPlayer.z)
    end
end
