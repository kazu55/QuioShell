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
