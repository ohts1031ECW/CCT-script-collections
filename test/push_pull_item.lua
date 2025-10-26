local chest_a = peripheral.wrap("minecraft:chest_0")
local chest_b = peripheral.wrap("minecraft:chest_1")

print(peripheral.getName(chest_a))
print(peripheral.getName(chest_b))

chest_b.pushItems(peripheral.getName(chest_a),1)