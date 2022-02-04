print("User?")
user = read()
print("Password?")
pass = read("*")
passr = fs.open("/home/." .. user .. ".pass.xyz", "r")
passrA = passr.readAll()
if pass == passrA then
    shell.run("QuioShell.lua")
else
    os.reboot()
end

term.clear()
term.setCursorPos(1,1)
print("QuioShell")
if fs.exists("/home/." .. user) then
    print("Login was successful.")
else
    shell.run("mkdir /home/." .. user)
    passw = fs.open("/home/." .. user .. ".pass.xyz", "w")
    passw.write(pass)
    passw.close()
    print("User creation was successful.")
end
