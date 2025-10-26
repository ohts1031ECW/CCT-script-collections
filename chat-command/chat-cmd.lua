local clear_sky = peripheral.wrap("redstoneIntegrator_2")
local time_sunrise = peripheral.wrap("redstoneIntegrator_3")
local chatBox = peripheral.wrap("top")


local prefix = "."
local chatname = "CMD"
while true do
    local event, username, message, uuid, isHidden = os.pullEvent("chat")

    local function startsWith(str, prefix)
        return string.sub(str, 1, string.len(prefix)) == prefix
    end

    --print("Chat message: " .. message)
    --print("IS prefix: " .. tostring(startsWith(message,prefix)))


    --If prefix
    if(startsWith(message,prefix))then
        local command = message:gsub("%.","")
        --print("message:"..message)
        print("command:"..command)


        --clear sky
        if command == "weather clear" then
            chatBox.sendMessage("clearring sky ",chatname)
            clear_sky.setOutput("top",true)
            sleep(1)
            clear_sky.setOutput("top",false)
        end

        --time set day
        if command == "time set day" then
            chatBox.sendMessage("time change to day",chatname)
            time_sunrise.setOutput("top",true)
            sleep(1)
            time_sunrise.setOutput("top",false)
        end
    end


end
