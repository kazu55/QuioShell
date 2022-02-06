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
  centerText("Shutting down")
  sleep(1)
  os.fadeout(0.05)
  sleep(0.5)
  term.setTextColor(colors.white)
  centerText(">_<")
  sleep(0.5)
  centerText("\7>\7 \3")
  sleep(0.5)
  centerText("-_-")
  sleep(0.5)
  centerText("-_-")
  sleep(0.5)
  centerText("\7_\7")
  sleep(0.5)
  centerText(">_<")
  sleep(0.5)
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
  os.fadeout(0.05)
  sleep(0.5)
  term.setTextColor(colors.white)
  centerText(">_<")
  sleep(0.5)
  centerText("\7>\7 \3")
  sleep(0.5)
  centerText("-_-")
  sleep(0.5)
  shutdown()
  while true do
    coroutine.yield()
  end
end


centerText("-_-")
sleep(0.5)
centerText("\7_\7")
sleep(0.5)
centerText(">_<")
sleep(0.5)
shell.run("/Quiologin.lua")
