local buildID = 0
term.clear()

http.request("https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt")

local requesting = true

while requesting do
  local event, url, sourceText = os.pullEvent()
  
  if event == "http_success" then
    local respondedText = sourceText.readAll()
    
    sourceText.close()
    requesting = false
  elseif event == "http_failure" then
    print("Server didn't respond.")
    
    requesting = false
  end
end
if tonumber(sourceText) > buildID then
  print("Updating... Please Wait...")
  shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua")
  shell.run("reboot")
end

print("User?")
user = read("*")
term.clear()
term.setCursorPos(1,1)
print("QuioShell")
if fs.exists("/home/" .. user) then
    shell.run("cd /home/" .. user)
    print("Login was successful.")
else
    shell.run("mkdir /home/" .. user)
    shell.run("cd /home/" .. user)
    print("User creation was successful")
end

while true do
    write(shell.dir() .. ":~$ ")
    cmd = read()
    shell.run(cmd)
end
