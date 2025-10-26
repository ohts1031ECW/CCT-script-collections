local Reader = peripheral.wrap("left")
--[[
for k, v in pairs(Reader.getBlockData()) do 
    print(k, v)
end
]]


--get IDs Display Value
local Part = Reader.getBlockData().partContainer.parts[2].displayValue

print(Part)
