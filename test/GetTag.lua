local chest = peripheral.wrap("minecraft:chest_0")

local Tag = "forge:ores"
local TagExist = false
for tag, TF in pairs(chest.getItemDetail(1).tags) do
    --print(("Tag: %s  TF: %s"):format(tag,TF))

    if tag == Tag then
        TagExist = true
    end
end

print(("forge:ores exist: %s"):format(TagExist))