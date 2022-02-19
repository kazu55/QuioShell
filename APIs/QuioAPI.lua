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
    for i = 6, 11 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(errorpic, 1, 1)
    term.setCursorPos(1, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    textutils.centerText(err)
    term.setCursorPos(47,11)
    term.setBackgroundColor(colors.lightGray)
    print(" OK ")
    while true do
        event, a, x, y = os.pullEvent("mouse_click")
        if x == 48 or x == 49 and y == 11 then
            term.setCursorPos(47,11)
            term.setBackgroundColor(colors.gray)
            print(" OK ")
            sleep(0.25)
            return
        end
    end
end

info = function(info)
    window = paintutils.loadImage("/APIs/QuioWindow.pic")
    infopic = paintutils.loadImage("/APIs/info.pic", 1, 1)
    for i = 6, 11 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(infopic, 1, 1)
    term.setCursorPos(1, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    textutils.centerText(info)
    term.setCursorPos(47,11)
    term.setBackgroundColor(colors.lightGray)
    print(" OK ")
    while true do
        event, a, x, y = os.pullEvent("mouse_click")
        if x == 48 or x == 49 and y == 11 then
            term.setCursorPos(47,11)
            term.setBackgroundColor(colors.gray)
            print(" OK ")
            sleep(0.25)
            return
        end
    end
end

warn = function(warn)
    window = paintutils.loadImage("/APIs/QuioWindow.pic")
    warnpic = paintutils.loadImage("/APIs/warn.pic", 1, 1)
    for i = 6, 11 do
        term.setCursorPos(1, i)
        term.clearLine()
    end
    paintutils.drawImage(window, 1, 1)
    paintutils.drawImage(warnpic, 1, 1)
    term.setCursorPos(1, 8)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    textutils.centerText(warn)
    term.setCursorPos(47,11)
    term.setBackgroundColor(colors.lightGray)
    print(" OK ")
    while true do
        event, a, x, y = os.pullEvent("mouse_click")
        if x == 48 or x == 49 and y == 11 then
            term.setCursorPos(47,11)
            term.setBackgroundColor(colors.gray)
            print(" OK ")
            sleep(0.25)
            return
        end
    end
end

os.setsuperaccess = function(access)
    superaccess = access
end
os.getsuperaccess = function()
    return superaccess
end