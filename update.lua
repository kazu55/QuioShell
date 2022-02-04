local buildID = 7
term.clear()
shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt")
local file = fs.open("buildID.txt", "r")
local data = file.readAll()

if tonumber(data) > buildID then
  print("Updating... Please Wait...")
  shell.run("rm /QuioShell.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua")
  shell.run("rm buildID.txt")
  shell.run("reboot")
else
  shell.run("rm buildID.txt")
end