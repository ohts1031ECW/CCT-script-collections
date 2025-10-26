print(arg[0])
print(arg[1])
print(arg[2])
local testURL = "https://api.github.com/repos/ohts1031ECW/JSMacros-Macros/contents/src/Scripts/utils/raid-farm-autoclick.js"
if arg[1] == nil  then
    print("The first parameter must have a URL")
end

if arg[2] == nil then
    print("The second parameter requires a file path")
end

--must have 2 parameter
if (not arg[1] == nil) and (not arg[2] == nil) then
    
end