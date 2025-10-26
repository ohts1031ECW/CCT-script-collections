local monitor = peripheral.find("monitor")

local monitorUtils = require "modules/drawline"
print(monitor.getSize())
monitorUtils.DrawLineX(monitor,colors.gray,0,1,50)