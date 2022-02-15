term.clear()
term.setCursorPos(1, 1)
print("User: " .. os.getuser())
if os.getofflinemode() then
    printError("Offline_mode")
end

print("Power Options(poweroff, reboot)")
Power = read()
if Power == "poweroff" then
    os.shutdown()
elseif Power == "reboot" then
    os.reboot()
else
    return
end