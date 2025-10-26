local chest = peripheral.wrap("minecraft:chest_0")
local slot = 1
if not chest.getItemDetail(slot) then
    print(false)
end

if chest.getItemDetail(slot) then
    print(true)
end
