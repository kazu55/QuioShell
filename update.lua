local buildID = 4120
term.clear()
shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt")
local file = fs.open("buildID.txt", "r")
local data = file.readAll()

if tonumber(data) > buildID then
  print("Updating... Please Wait...")
  shell.run("rm /APIs/*")
  shell.run("rm /System/*")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Quiologin.lua /System/Programs/Quiologin.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/update.lua /System/Programs/update.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua /System/Programs/QuioShell.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/startup.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/iconlauncher.lua /System/Programs/iconlauncher.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/adduser.lua /System/Programs/adduser.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioAPI.lua")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioWindow.pic")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/err.pic")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/mode.lua")
  shell.run("rm buildID.txt")
  shell.run("reboot")
else
  shell.run("rm buildID.txt")
end
