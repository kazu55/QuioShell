os.loadAPI("/APIs/QuioAPI.lua")
local SystemDir = "/System/"


os.fadeout = function(time)
  term.setBackgroundColor(colors.white)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.lightBlue)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.lightGray)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.gray)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.black)
  term.clear()
  sleep(time)
end

os.fadeIn = function(time)
  term.setBackgroundColor(colors.black)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.gray)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.lightGray)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.lightBlue)
  term.clear()
  sleep(time)
  term.setBackgroundColor(colors.white)
  term.clear()
  sleep(time)
end

local function centerText(text)
  local x,y = term.getSize()
  local x2, y2 = term.getCursorPos()
  term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
  write(text)
end

local reboot = os.reboot

os.reboot = function()
  term.setBackgroundColor(colors.white)
  term.setTextColor(colors.black)
  term.clear()
  term.setCursorPos(1, 2)
  centerText("Restarting...")
  sleep(1)
  os.fadeout(0.05)
  term.clear()
  sleep(1)
  reboot()
  while true do
    coroutine.yield()
  end
end

local shutdown = os.shutdown

os.shutdown = function()
  term.setBackgroundColor(colors.white)
  term.setTextColor(colors.black)
  term.clear()
  term.setCursorPos(1, 2)
  centerText("Shutting down")
  sleep(1)
  term.clear()
  term.setCursorPos(1, 2)
  os.fadeout(0.05)
  term.clear()
  sleep(1)
  shutdown()
  while true do
    coroutine.yield()
  end
end
term.clear()
os.fadeIn(0.05)
term.setTextColor(colors.black)
os.setofflinemode(false)

--QUIO
QUIO = paintutils.loadImage("/startup.ico")
term.setCursorPos(1,2)
term.setBackgroundColor(colors.blue)
centerText("QuioSystem")

term.setBackgroundColor(colors.white)
term.setCursorPos(1,1)
write(".")
http.request("http://google.com")

local requesting = true

while requesting do
  local event, url, sourceText = os.pullEvent()
  if event == "http_failure" then
    term.clear()
    term.setCursorPos(1, 2)
    QuioAPI.error("Internet Connect is failed.")
    sleep(1)
    os.setofflinemode(true)
    http.checkURL = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    http.request = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    http.post = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    http.put = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    http.websocket = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    http.get = function()
      QuioAPI.notice("Sorry. HTTP API is not available.")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      term.setCursorPos(1, 1)
    end
    term.setCursorPos(1,1)
    requesting = false
  end
  requesting = false
end
term.setCursorPos(1,1)
write(".")

delete = fs.delete

fs.delete = function(file)
  if string.find(file, "System") or string.find(file, "startup") then
    QuioAPI.error("file not deleted. Reason: Access Denied")
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
  else
    delete(file)
  end
end
term.setCursorPos(1,1)
write(".")

term.clear()
term.setCursorPos(1, 1)

if fs.exists("/home") then
  term.clear()
  while true do
    shell.run(SystemDir .. "/Programs/Quiologin.lua")
    sleep(1)
  end
else
  term.clear()
  centerText("-_-")
  sleep(1)
  centerText("\7_\7")
  sleep(0.0)
  centerText("-_-")
  sleep(0.1)
  centerText("\7_\7")
  sleep(0.1)
  centerText("-_-")
  sleep(0.1)
  centerText("\7_\7")
  sleep(0.1)
  centerText("-_-")
  sleep(0.1)
  centerText("\7_\7")
  sleep(0.25)
  centerText(">_<")
  sleep(0.5)
  term.setCursorPos(1, 1)
  centerText("Nice to meet you.")
  sleep(3)
  term.clearLine()
  term.setCursorPos(1, 1)
  centerText("I'm Martine.")
  sleep(3)
  term.clearLine()
  term.setCursorPos(1, 1)
  centerText("Let's do the initial setup!")
  sleep(5)
  term.clear()
  term.setCursorPos(1, 1)
  sleep(0.5)
  os.fadeIn(0.05)
  sleep(0.05)
  term.setTextColor(colors.black)
  centerText("First, let's set up the user.")
  sleep(2.5)
  term.clear()
  term.setCursorPos(1, 1)
  write("User: ")
  user = read()
  write("Password(Option): ")
  pass = read("*")
  if not fs.exists("/home/." .. user .. ".pass.xyz") then
    shell.run("mkdir /home/." .. user)
    passwrite = fs.open("/home/." .. user .. ".pass.xyz", "w")
    passwrite.write(pass)
    passwrite.close()
  end
  term.clear()
  term.setCursorPos(1, 1)
  centerText("Finally, make sure you have internet access.")
  sleep(3)
  term.clear()
  term.setCursorPos(1,1)
  centerText("Connect to internet. Please wait.")
  sleep(3)
   	

  http.request("http://google.com")

  local requesting = true

    while requesting do
    local event, url, sourceText = os.pullEvent()
  
    if event == "http_success" then
      term.clear()
      term.setCursorPos(1, 1)
      centerText("Setup is complete. Restarting...")
      sleep(1)
      shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/missing.ico /home/." .. user .. "/Apps/missing.ico")
      shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua /home/." .. user .. "/Apps/Power.lua")
      shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua.ico /home/." .. user .. "/Apps/Power.lua.ico")
      shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua.ico /home/." .. user .. "/Apps/QuioShell.lua.ico")
      shell.run("wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua /home/." .. user .. "/Apps/QuioShell.lua")
      os.reboot()

      requesting = false
    elseif event == "http_failure" then
      term.clear()
      term.setCursorPos(1, 1)
      print("Server didn't respond. Setup is complete. Restarting...")
      sleep(1)
      os.reboot()
      requesting = false
    end
  end
end

