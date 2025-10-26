local Lib = require("/storage/Libs/lib")
local MEBridge = peripheral.find("meBridge")
-- クラフト個数を指定する部分はまだ実装していません

--[[
config file format

    {
        "Target": {
            "name":アイテムID,
            "nbt" : NBT(あれば)
        },
        "config": {
            "max": クラフト停止個数,
            "min": クラフト開始個数,
            "type": 種類(アイテム,液体,ガス)  Item,Fluid,Gas,
            "amount": 一度に発注するアイテム数 -1で最大-最小
        }
    }


]]

function GenCraftAmount(Amount, TargetCount, Max)
    if Amount == -1 then
        return Max - TargetCount
    else
        return Amount
    end
end

local file = fs.open("/storage/ME-bridge/autostocker/config.json", "r")
local content = file.readAll()
file.close()




for I, value in pairs(textutils.unserializeJSON(content)) do
    local Target = value.Target
    local config = value.config
    local TargetType = config.type

    --print(TargetType)

    --Item
    if TargetType == "Item" then
        local TargetItem = MEBridge.getItem(Target)

        --クラフト不可ならスキップ
        if not TargetItem.isCraftable then
            return;
        end

        --アイテムの在庫数がminimum以下の時に実行
        if TargetItem.amount <= config.min then
            --アイテムがすでにクラフト中なら除外
            if MEBridge.isItemCrafting(Target) then
                return;
            end

            Target["count"] = GenCraftAmount(
                config.amount,
                TargetItem.amount,
                config.max
            )

            Lib.PrintTable(Target)

            --print(Target["amount"])
            --クラフト
            print(MEBridge.craftItem(Target))
        end

        --print(TargetItem.amount)


        --Fluid
    elseif TargetType == "Fluid" then
        --Gas
    elseif TargetType == "Gas" then

    end
end
