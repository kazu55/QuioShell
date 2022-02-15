term.clear()
term.setCursorPos(1, 1)
print("User: " .. os.getuser())
if os.getofflinemode() then
    printError("Offline_mode")
end
while true do
    if shell.dir() == "" then
        write("/:~$ ")
        cmd = read()
        if cmd == "shutdown" then
            printError("No such program")
        elseif cmd == "reboot" then
            os.reboot()
        elseif cmd == "poweroff" then
            os.shutdown()
        elseif cmd == "exit" then
            return
        else
            shell.run(cmd)
        end
    else
        write(shell.dir() .. ":~$ ")
        cmd = read()
        if cmd == "shutdown" then
            printError("No such program")
        elseif cmd == "reboot" then
            os.reboot()
        elseif cmd == "poweroff" then
            os.shutdown()
        elseif cmd == "exit" then
            return
        else
            shell.run(cmd)
        end
    end
end
