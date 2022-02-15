textutils.centerText = function(text)
    local x,y = term.getSize()
    local x2, y2 = term.getCursorPos()
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
    write(text)
end

os.setofflinemode = function(mode)
    if mode then
        offline = true
    elseif not mode then
        offline = false
    end
end

os.setuser = function(user)
    users = tostring(user)
end
os.getuser = function()
    return users
end

os.getofflinemode = function()
    return offline
end

error = function(err)
    window = paintutils.loadImage("/APIs/QuioWindow.pic")
    errorpic = paintutils.loadImage("/APIs/err.pic", 1, 1)
    for i = 6, 13 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(errorpic, 1, 1)
    term.setCursorPos(9, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    print(err)
    os.pullEvent("key")
end
