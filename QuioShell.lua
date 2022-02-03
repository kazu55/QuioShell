local buildID = 2
term.clear()
shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt")
local file = fs.open("buildID.txt", "r")
local data = file.readAll()

if tonumber(data) > buildID then
  print("Updating... Please Wait...")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua")
  shell.run("rm buildID.txt")
  shell.run("reboot")
else
    shell.run("rm buildID.txt")
end

print("User?")
user = read("*")
term.clear()
term.setCursorPos(1,1)
print("QuioShell")
if fs.exists("/home/" .. user) then
    print("Login was successful.")
else
    shell.run("mkdir /home/" .. user)
    print("User creation was successful.")
end

while true do
    write(user .. ":~" .. shell.dir() .. "$ ")
    cmd = read()
    shell.run("cd /home" .. user)
    shell.run(cmd)
end
