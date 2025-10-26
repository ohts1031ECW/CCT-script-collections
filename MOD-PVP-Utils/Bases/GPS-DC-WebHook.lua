local PlayerDetector = peripheral.find("playerDetector")
local WebHookURL =
"https://discord.com/api/webhooks/1292801562422411295/g-1myKr7mL6r9yZwvxM_wQMg-QRDhe26BkHc5q0_h1A4VTV_OK099bIcC7XzMIwhWk2Z"

while true do
    local content = "```\n"
    for key, PlayerName in pairs(PlayerDetector.getOnlinePlayers()) do
        local PlayerData = PlayerDetector.getPlayer(PlayerName)
        --print(PlayerData)

        --set variable
        content = content ..
            ("Name:%s, X:%d Y:%d, Z:%d, Dim:%s, Health:%d/%d,\n\n")
            :format(
            PlayerName,
            PlayerData.x,
            PlayerData.y,
            PlayerData.z,
            PlayerData.dimension,
            PlayerData.health,
            PlayerData.maxHealth
        )
    end
    content = content .. "```"
    local RequestBody = textutils.serialiseJSON({
        content = content,
        username = "GPS-Log"
    })
    local RequestHeader = {
        ["Content-Type"] = "application/json"
    }
    http.request
    {
        url = WebHookURL,
        body = RequestBody,
        headers = RequestHeader
    }

    parallel.waitForAny(function()
            local event, url, handle = os.pullEvent("http_success")
            print("WebHook content send successfull")
        end,
        function()
            local event, url, handle = os.pullEvent("http_failure")
            print("failure")
        end
    )
    --wait 1m
    sleep(60)
end
