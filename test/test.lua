local peripheralNames = peripheral.getNames()

print(peripheralNames)

for key, value in pairs(peripheralNames) do
  print(value)
end