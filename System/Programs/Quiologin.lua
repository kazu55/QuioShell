os.fadeIn(0.05)
term.setTextColor(colors.black)
term.clear()
term.setCursorPos(1,1)
write("User: ")

user = read()
write("Password: ")
pass = read("\7")
os.fadeout(0.05)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)

if user == "" then
    print("Wrong.")
    return
end
if not fs.exists("/home/." .. user .. ".pass.xyz") then
    shell.run("mkdir /home/." .. user)
    passwrite = fs.open("/home/." .. user .. ".pass.xyz", "w")
    passwrite.write(pass)
    passwrite.close()
    os.setuser(user)
    shell.run("/System/Programs/iconlauncher.lua")
end

passread = fs.open("/home/." .. user .. ".pass.xyz", "r")
passrA = passread.readAll()
if pass == passrA then
    term.clear()
    term.setCursorPos(1,1)
    os.setuser(user)
    shell.run("/System/Programs/iconlauncher.lua")
else
    print("Wrong.")
    sleep(1)
    return
end

term.clear()
term.setCursorPos(1,1)
if fs.exists("/home/." .. user) then
    print("Login was successful.")
    os.setuser(user)
    shell.run("/System/Programs/iconlauncher.lua")
end
