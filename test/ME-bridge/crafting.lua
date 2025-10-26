local AE = peripheral.wrap("top")

local SwitchItems = {
    {
        name = "minecraft:red_stained_glass_pane",
        nbt = "{RepairCost:0,display:{Name:'{\"text\":\"[SW] mysticalagriculture\"}'}}"
    },
    {
        name = 'minecraft:red_stained_glass_pane',
        nbt = "{RepairCost:0,display:{Name:'{\"text\":\"[SW] UnstackableItems\"}'}}"
    }

}

for index, value in ipairs(SwitchItems) do
    local bool = AE.isItemCrafting(value)
    print(index .. ": " ..  tostring(bool))
end

