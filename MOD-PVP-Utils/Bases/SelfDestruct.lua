local PlayerDetector = peripheral.find("playerDetector")
local Ignore_Players = { "ohts1031_ECW" }
local Range = 2
local Temp = {}
local BaseDir = "programs"

for index, Player in ipairs(Ignore_Players) do
    Temp[Player] = true
end

while true do
    local Player_In_Range = PlayerDetector.getPlayersInRange(Range) --GetPlayerInRange
    for Key1, PlayerName in pairs(Player_In_Range) do
        --print("name: "..PlayerName)

        --not ignored player
        if not Temp[PlayerName] then
            print("Destructing")

            --Delete BaseDir/* Files
            for key, File2 in pairs(fs.list(BaseDir)) do
                fs.delete(BaseDir .. "/" .. File2)
                print(BaseDir .. "/" .. File2)
            end

            --Delete BaseDir directory
            fs.delete(BaseDir)
            return false
        end
    end
end
