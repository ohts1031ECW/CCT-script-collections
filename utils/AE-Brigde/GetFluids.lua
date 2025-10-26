local AE_Bridge = peripheral.wrap("bottom")



for key, value in pairs(AE_Bridge.listFluid()) do
    print(value.displayName)
    --[[
    for key2, value2 in pairs(value) do
        print(value2)
    end
    ]]
end