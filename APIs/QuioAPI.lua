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
    for i = 6, 12 do
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

info = function(info)
    window = paintutils.loadImage("/APIs/QuioWindow.pic")
    infopic = paintutils.loadImage("/APIs/info.pic", 1, 1)
    for i = 6, 12 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(infopic, 1, 1)
    term.setCursorPos(9, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    print(info)
    os.pullEvent("key")
end

warn = function(warn)
    window = paintutils.loadImage("/APIs/QuioWindow.pic")
    warnpic = paintutils.loadImage("/APIs/warn.pic", 1, 1)
    for i = 6, 12 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(warnpic, 1, 1)
    term.setCursorPos(9, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    print(warn)
    os.pullEvent("key")
end

os.setsuperaccess = function(access)
    superaccess = access
end
os.getsuperaccess = function()
    return superaccess
end
