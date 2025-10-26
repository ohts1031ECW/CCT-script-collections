local invmanager = peripheral.wrap("right")

local count = 0


while true do

    if invmanager.getItemInOffHand().name == nil then

        invmanager.addItemToPlayer("up", {name="minecraft:totem_of_undying", toSlot=36, count=1})
        count = count +1
        print(count)
    end
    
end