local function DrawLineX(Monitor,Color,x,y,length)
    local oldBackGroundColor = Monitor.getBackgroundColor() --save default BG Color
    Monitor.setBackgroundColor(Color)

    for i = 1, length, 1 do
        Monitor.setCursorPos(x+i,y)
        Monitor.write(" ")
    end
    Monitor.setBackgroundColor(oldBackGroundColor)
end

local function DrawLineY(Monitor,Color,x,y,length)
    local oldBackGroundColor = Monitor.getBackgroundColor() --save default BG Color
    Monitor.setBackgroundColor(Color)

    for i = 1, length, 1 do
        Monitor.setCursorPos(x+i,y)
        Monitor.write(" ")
    end
    Monitor.setBackgroundColor(oldBackGroundColor)
end

return {
    DrawLineX = DrawLineX,
    DrawLineY = DrawLineY
}