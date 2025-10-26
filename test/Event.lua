while true do
    local event, side = os.pullEvent("peripheral")
    print("A peripheral was attached on side " .. side)
  end