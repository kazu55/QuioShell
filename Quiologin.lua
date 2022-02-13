term.clear()
term.setCursorPos(1,1)
write("User: ")
user = read()
write("Password: ")
pass = read("*")
if not fs.exists("/home/." .. user .. ".pass.xyz") then
    shell.run("mkdir /home/." .. user)
    passwrite = fs.open("/home/." .. user .. ".pass.xyz", "w")
    passwrite.write(pass)
    passwrite.close()
    shell.run("hometab.lua")
end

passread = fs.open("/home/." .. user .. ".pass.xyz", "r")
passrA = passread.readAll()
if pass == passrA then
    term.clear()
    term.setCursorPos(1,1)
    print("Login successful.")
    shell.run("hometab.lua")
else
    print("Login Failed.")
    return
end

term.clear()
term.setCursorPos(1,1)
if fs.exists("/home/." .. user) then
    print("Login was successful.")
    shell.run("/hometab.lua")
end
