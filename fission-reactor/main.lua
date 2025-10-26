local monitorID = multishell.launch({}, "/storage/fission-reactor/modules/monitor.lua")
local controllerID = multishell.launch({},"/storage/fission-reactor/modules/controller.lua")
multishell.setTitle(monitorID, "monitor")
multishell.setTitle(controllerID,"controller")