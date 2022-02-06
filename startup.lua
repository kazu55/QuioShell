os.fadeout = function(time)
  term.setBackgroundColor(colors.white)
  sleep(time)
  term.setBackgroundColor(colors.lightblue)
  sleep(time)
  term.setBackgroundColor(colors.lightGray)
  sleep(time)
  term.setBackgroundColor(colors.glay)
  sleep(time)
  term.setBackgroundColor(colors.black)
  sleep(time)
end

local reboot = os.reboot

os.reboot = function()
  term.setCursorPos(1, 2)
  centerText("Shutting down")
  sleep(1)
  os.fadeout()
  reboot()
  while true do
    coroutine.yield()
  end
end

local function centerText(text)
  local x,y = term.getSize()
  local x2, y2 = term.getCursorPos()
  term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
  write(text)
end

local shutdown = os.shutdown

os.shutdown = function()
  term.setCursorPos(1, 2)
  centerText("Shutting down")
  sleep(1)
  os.fadeout()
  shutdown()
  while true do
    coroutine.yield()
  end
end


shell.run("/Quiologin.lua")
