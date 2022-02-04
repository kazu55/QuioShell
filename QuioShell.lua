print("User?")
user = read()
term.clear()
term.setCursorPos(1,1)
print("QuioShell")
if fs.exists("/home/." .. user) then
    print("Login was successful.")
else
    shell.run("mkdir /home/." .. user)
    print("User creation was successful.")
end

while true do
    write(user .. ":~" .. shell.dir() .. "$ ")
    cmd = read()
    shell.run(cmd)
end
