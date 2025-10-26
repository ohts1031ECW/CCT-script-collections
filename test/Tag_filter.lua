while true do
    local input_dimstorage = peripheral.wrap("dimstorage:dimensional_chest_3")
    local DimStorage_Name = peripheral.getName(input_dimstorage)
    local SearchTag = "forge:ores"

    -- if length 0<=
    if #input_dimstorage.list() > 0 then
        --item
        for In_slot_Index, item in pairs(input_dimstorage.list()) do
            --SearchTag is Exist true/false
            local TagExist = false
            for tag, TF in pairs(input_dimstorage.getItemDetail(In_slot_Index).tags) do
                --print(("Tag: %s  TF: %s"):format(tag,TF))

                if tag == SearchTag then
                    TagExist = true
                end
            end

            --IF SearchTag Exist true
            if TagExist then
                local ores_chest = peripheral.wrap("ironchest:diamond_chest_1")

                for Out_Slot_Index = 1, ores_chest.size(), 1 do

                    --if not exist item
                    if not ores_chest.getItemDetail(Out_Slot_Index) then
                        --push item to ores_chest
                        --print("Out_Slot_Index: "..Out_Slot_Index)
                        ores_chest.pushItems(DimStorage_Name, In_slot_Index)--, 64, Out_Slot_Index)
                    end
                end
                
                print("ores")
                --other
            else
                local other_chest = peripheral.wrap("ironchest:diamond_chest_0")

                for Out_Slot_Index = 1, other_chest.size(), 1 do

                    --if not exist item
                    if not other_chest.getItemDetail(Out_Slot_Index) then
                        --push item to other chest
                        --print("Out_Slot_Index: "..Out_Slot_Index)
                        other_chest.pushItems(DimStorage_Name, In_slot_Index)--, 64,Out_Slot_Index)
                    end
                end

                print("other")
            end

        end
    end
end
