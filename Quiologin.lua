term.clear()
term.setCursorPos(1,1)
print("User?")
user = read()
print("Password?")
pass = read("*")
if not fs.exists("/home/." .. user .. ".pass.xyz") then
    shell.run("mkdir /home/." .. user)
    passwrite = fs.open("/home/." .. user .. ".pass.xyz", "w")
    passwrite.write(pass)
    passwrite.close()
    shell.run("reboot")
end

passread = fs.open("/home/." .. user .. ".pass.xyz", "r")
passrA = passread.readAll()
if pass == passrA then
    term.clear()
    term.setCursorPos(1,1)
    print("QuioShell")
    shell.run("QuioShell.lua")
else
    print("Login Failed.")
    shell.run("reboot")
end

term.clear()
term.setCursorPos(1,1)
print("QuioShell")
if fs.exists("/home/." .. user) then
    print("Login was successful.")
    shell.run("/QuioShell.lua")
end
