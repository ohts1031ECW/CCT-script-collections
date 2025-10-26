local monitor = peripheral.find("monitor")
local energy = peripheral.wrap("appflux:flux_accessor_0")

monitor.setCursorPos(1, 1)
monitor.write(("energy: %s"):format(energy.getEnergy()))
monitor.setCursorPos(1, 2)
monitor.write(("energycap: %s"):format(energy.getEnergyCapacity()))

for index, value in ipairs(peripheral.getMethods("appflux:flux_accessor_0")) do
    print(("index: %s  value: %s"):format(index,value))

end