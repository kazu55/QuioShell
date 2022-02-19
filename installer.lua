local tmpTbl = {
  [ "System/Programs/QuioShell.lua" ] = "while true do\
    if shell.dir() == \"\" then\
        write(\"/:~$ \")\
        cmd = read()\
        if cmd == \"shutdown\" then\
            printError(\"No such program\")\
        elseif cmd == \"reboot\" then\
            os.reboot()\
        elseif cmd == \"poweroff\" then\
            os.shutdown()\
        elseif cmd == \"exit\" then\
            return\
        else\
            QuioAPI.Quiorun(cmd)\
        end\
    else\
        write(shell.dir() .. \":~$ \")\
        cmd = read()\
        if cmd == \"shutdown\" then\
            printError(\"No such program\")\
        elseif cmd == \"reboot\" then\
            os.reboot()\
        elseif cmd == \"poweroff\" then\
            os.shutdown()\
        elseif cmd == \"exit\" then\
            return\
        else\
            QuioAPI.Quiorun(cmd)\
        end\
    end\
end\
",
  [ "System/Programs/buildID.txt" ] = "4121\
",
  [ "/startup.lua" ] = "os.loadAPI(\"/APIs/QuioAPI.lua\")\
local SystemDir = \"/System/\"\
\
\
os.fadeout = function(time)\
  term.setBackgroundColor(colors.white)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.lightBlue)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.lightGray)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.gray)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.black)\
  term.clear()\
  sleep(time)\
end\
\
os.fadeIn = function(time)\
  term.setBackgroundColor(colors.black)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.gray)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.lightGray)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.lightBlue)\
  term.clear()\
  sleep(time)\
  term.setBackgroundColor(colors.white)\
  term.clear()\
  sleep(time)\
end\
\
local function centerText(text)\
  local x,y = term.getSize()\
  local x2, y2 = term.getCursorPos()\
  term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)\
  write(text)\
end\
\
local reboot = os.reboot\
\
os.reboot = function()\
  term.setBackgroundColor(colors.white)\
  term.setTextColor(colors.black)\
  term.clear()\
  term.setCursorPos(1, 2)\
  centerText(\"Restarting...\")\
  sleep(1)\
  os.fadeout(0.05)\
  term.clear()\
  sleep(1)\
  reboot()\
  while true do\
    coroutine.yield()\
  end\
end\
\
local shutdown = os.shutdown\
\
os.shutdown = function()\
  term.setBackgroundColor(colors.white)\
  term.setTextColor(colors.black)\
  term.clear()\
  term.setCursorPos(1, 2)\
  centerText(\"Shutting down\")\
  sleep(1)\
  term.clear()\
  term.setCursorPos(1, 2)\
  os.fadeout(0.05)\
  term.clear()\
  sleep(1)\
  shutdown()\
  while true do\
    coroutine.yield()\
  end\
end\
term.clear()\
os.fadeIn(0.05)\
term.setTextColor(colors.black)\
os.setofflinemode(false)\
\
--QUIO\
QUIO = paintutils.loadImage(\"/startup.ico\")\
term.setCursorPos(1,2)\
term.setTextColor(colors.blue)\
centerText(\"QuioSystem\")\
\
term.setBackgroundColor(colors.white)\
term.setCursorPos(1,1)\
write(\".\")\
http.request(\"http://google.com\")\
\
local requesting = true\
\
while requesting do\
  local event, url, sourceText = os.pullEvent()\
  if event == \"http_failure\" then\
    term.clear()\
    term.setCursorPos(1, 2)\
    QuioAPI.error(\"Internet Connect is failed.\")\
    os.setofflinemode(true)\
    http.checkURL = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    http.request = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    http.post = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    http.put = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    http.websocket = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    http.get = function()\
      QuioAPI.info(\"HTTP API is not available.\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
    end\
    term.setCursorPos(1,1)\
    requesting = false\
  end\
  requesting = false\
end\
term.setCursorPos(1,1)\
write(\".\")\
\
delete = fs.delete\
move = fs.move\
copy = fs.copy\
\
fs.delete = function(file)\
  file_a = tostring(file)\
  aceess = 1\
  if aceess == 1 and string.find(file_a, \"System\") or string.find(file_a, \"startup\") or string.find(file_a, \"home\") or string.find(file_a, \"*\") or string.find(file_a, \"APIs\") then\
    if os.getsuperaccess() then\
      delete(file)\
      aceess = 0\
    else\
      QuioAPI.error(\"file not deleted. Reason: Access Denied\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
      aceess = 0\
    end\
  else\
    delete(file)\
    aceess = 0\
  end\
end\
\
fs.move = function(file)\
  file_b = tostring(file)\
  aceess = 1\
  if aceess == 1 and string.find(file_b, \"System\") or string.find(file_b, \"startup\") or string.find(file_b, \"home\") or string.find(file_b, \"*\") or string.find(file_b, \"APIs\") then\
    if os.getsuperaccess() then\
      move(file)\
      aceess = 0\
    else\
      QuioAPI.error(\"file not moved. Reason: Access Denied\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
      aceess = 0\
    end\
  else\
    move(file)\
    aceess = 0\
  end\
end\
\
fs.copy = function(file)\
  file_c = tostring(file)\
  aceess = 1\
  if aceess == 1 and string.find(file_c, \"System\") or string.find(file_c, \"startup\") or string.find(file_c, \"home\") or string.find(file_c, \"*\") or string.find(file_c, \"APIs\") then\
    if os.getsuperaccess() then\
      copy(file)\
      aceess = 0\
    else\
      QuioAPI.error(\"file not copyed. Reason: Access Denied\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
      aceess = 0\
    end\
  else\
    copy(file)\
    aceess = 0\
  end\
end\
\
fs.move = function(file)\
  file_d = tostring(file)\
  aceess = 1\
  if aceess == 1 and string.find(file_d, \"System\") or string.find(file_d, \"startup\") or string.find(file_d, \"home\") or string.find(file_d, \"*\") or string.find(file_d, \"APIs\") then\
    if os.getsuperaccess() then\
      move(file)\
      aceess = 0\
    else\
      QuioAPI.error(\"file not deleted. Reason: Access Denied\")\
      term.setBackgroundColor(colors.black)\
      term.setTextColor(colors.white)\
      term.clear()\
      term.setCursorPos(1, 1)\
      aceess = 0\
    end\
  else\
    move(file)\
    aceess = 0\
  end\
end\
\
term.setCursorPos(1,2)\
write(\".\")\
\
os.setsuperaccess(false)\
if fs.exists(\"/home\") then\
  print(\"Starting startup programs...\")\
  if not fs.exists(\"/System/startup/\") then\
    fs.makeDir(\"/System/startup/\")\
  end\
  local startup = fs.list(\"/System/startup/\")\
  for i = 1, #startup do\
    print(\"Starting \" .. startup[i])\
    sleep(0.1)\
    shell.run(\"/System/startup/\" .. startup[i])\
  end\
  term.clear()\
term.setCursorPos(1, 1)\
  term.clear()\
  while true do\
    shell.run(SystemDir .. \"/Programs/Quiologin.lua\")\
    sleep(1)\
  end\
else\
  term.clear()\
  term.setCursorPos(1, 2)\
  term.clear()\
  centerText(\"-_-\")\
  sleep(1)\
  centerText(\"\\7_\\7\")\
  sleep(0.0)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.1)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.1)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.25)\
  centerText(\">_<\")\
  sleep(0.5)\
  term.setCursorPos(1, 1)\
  centerText(\"Nice to meet you.\")\
  sleep(3)\
  term.clearLine()\
  term.setCursorPos(1, 1)\
  centerText(\"I'm Martine.\")\
  sleep(3)\
  term.clearLine()\
  term.setCursorPos(1, 1)\
  centerText(\"Let's do the initial setup!\")\
  sleep(5)\
  term.clear()\
  term.setCursorPos(1, 1)\
  sleep(0.5)\
  os.fadeIn(0.05)\
  sleep(0.05)\
  term.setTextColor(colors.black)\
  centerText(\"First, let's set up the user.\")\
  sleep(2.5)\
  term.clear()\
  term.setCursorPos(1, 1)\
  write(\"User: \")\
  user = read()\
  write(\"Password(Option): \")\
  pass = read(\"*\")\
  if not fs.exists(\"/home/.\" .. user .. \".pass.xyz\") then\
    shell.run(\"mkdir /home/.\" .. user)\
    passwrite = fs.open(\"/home/.\" .. user .. \".pass.xyz\", \"w\")\
    passwrite.write(pass)\
    passwrite.close()\
  end\
  term.clear()\
  term.setCursorPos(1, 1)\
  centerText(\"Finally, make sure you have internet access.\")\
  sleep(3)\
  term.clear()\
  term.setCursorPos(1,1)\
  centerText(\"Connect to internet. Please wait.\")\
  sleep(3)\
   	\
\
  http.request(\"http://google.com\")\
\
  local requesting = true\
\
    while requesting do\
    local event, url, sourceText = os.pullEvent()\
  \
    if event == \"http_success\" then\
      term.clear()\
      term.setCursorPos(1, 1)\
      centerText(\"Setup is complete. Restarting...\")\
      sleep(1)\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/missing.ico /home/.\" .. user .. \"/Apps/missing.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua /home/.\" .. user .. \"/Apps/Power.lua\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua.ico /home/.\" .. user .. \"/Apps/Power.lua.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua.ico /home/.\" .. user .. \"/Apps/QuioShell.lua.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua /home/.\" .. user .. \"/Apps/QuioShell.lua\")\
      os.reboot()\
\
      requesting = false\
    elseif event == \"http_failure\" then\
      term.clear()\
      term.setCursorPos(1, 1)\
      print(\"Server didn't respond. Setup is complete. Restarting...\")\
      sleep(1)\
      os.reboot()\
      requesting = false\
    end\
  end\
end\
\
",
  [ "APIs/warn.pic" ] = "\
\
\
\
111111111111111111111111111111111111111111111111111\
\
\
\
\
\
\
\
111111111111111111111111111111111111111111111111111\
",
  [ "System/Programs/update.lua" ] = "local buildID = 4120\
term.clear()\
shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt\")\
local file = fs.open(\"./buildID.txt\", \"r\")\
local data = file.readAll()\
\
if tonumber(data) > buildID then\
  os.setsuperaccess(true)\
  print(\"Updating... Please Wait...\")\
  shell.run(\"rm /Quiologin.lua\")\
  shell.run(\"rm /QuioShell.lua\")\
  shell.run(\"rm /update.lua\")\
  shell.run(\"rm /startup.lua\")\
  shell.run(\"rm /hometab.lua\")\
  shell.run(\"rm /iconlauncher.lua\")\
  shell.run(\"rm /mode.lua\")\
  shell.run(\"rm /APIs/*\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Quiologin.lua /System/Programs/Quiologin.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/update.lua /System/Programs/update.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua /System/Programs/QuioShell.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/startup.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/iconlauncher.lua /System/Programs/iconlauncher.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/adduser.lua /System/Programs/adduser.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioAPI.lua /APIs/QuioAPI.lua\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioWindow.pic /APIs/QuioWindow.pic\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/err.pic /APIs/err.pic\")\
  shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/info.pic /APIs/info.pic\")\
  shell.run(\"rm buildID.txt\")\
  shell.run(\"reboot\")\
else\
  shell.run(\"rm buildID.txt\")\
end\
",
  [ "System/icons/startup.ico" ] = "\
\
\
\
      111111     11      11    1111     11111\
    11      11   11      11     11    11     11\
    11      11   11      11     11    11     11\
    11      11   11      11     11    11     11\
    11   1  11   11      11     11    11     11\
    11   11 11   11      11     11    11     11\
      111111     11      11     11    11     11\
           11      111111      1111    111111\
",
  [ "System/Programs/adduser.lua" ] = "local function centerText(text)\
    local x,y = term.getSize()\
    local x2, y2 = term.getCursorPos()\
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)\
    write(text)\
  end\
\
\
  term.clear()\
  centerText(\"-_-\")\
  sleep(1)\
  centerText(\"\\7_\\7\")\
  sleep(0.0)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.1)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.1)\
  centerText(\"-_-\")\
  sleep(0.1)\
  centerText(\"\\7_\\7\")\
  sleep(0.25)\
  centerText(\">_<\")\
  sleep(0.5)\
  term.setCursorPos(1, 1)\
  centerText(\"Nice to meet you.\")\
  sleep(3)\
  term.clearLine()\
  term.setCursorPos(1, 1)\
  centerText(\"I'm Martine.\")\
  sleep(3)\
  term.clearLine()\
  term.setCursorPos(1, 1)\
  centerText(\"Let's do the initial setup!\")\
  sleep(5)\
  term.clear()\
  term.setCursorPos(1, 1)\
  sleep(0.5)\
  os.fadeIn(0.05)\
  sleep(0.05)\
  term.setTextColor(colors.black)\
  centerText(\"First, let's set up the user.\")\
  sleep(2.5)\
  term.clear()\
  term.setCursorPos(1, 1)\
  write(\"User: \")\
  user = read()\
  write(\"Password(Option): \")\
  pass = read(\"*\")\
  if not fs.exists(\"/home/.\" .. user .. \".pass.xyz\") then\
    shell.run(\"mkdir /home/.\" .. user)\
    passwrite = fs.open(\"/home/.\" .. user .. \".pass.xyz\", \"w\")\
    passwrite.write(pass)\
    passwrite.close()\
  end\
  term.clear()\
  term.setCursorPos(1, 1)\
  centerText(\"Finally, make sure you have internet access.\")\
  sleep(3)\
  term.clear()\
  term.setCursorPos(1,1)\
  centerText(\"Connect to internet. Please wait.\")\
  sleep(3)\
   	\
\
  http.request(\"http://google.com\")\
\
  local requesting = true\
\
    while requesting do\
    local event, url, sourceText = os.pullEvent()\
  \
    if event == \"http_success\" then\
      term.clear()\
      term.setCursorPos(1, 1)\
      centerText(\"Setup is complete. Apps Downloading...\")\
      sleep(1)\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/missing.ico /home/.\" .. user .. \"/Apps/missing.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua /home/.\" .. user .. \"/Apps/Power.lua\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/Power.lua.ico /home/.\" .. user .. \"/Apps/Power.lua.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua.ico /home/.\" .. user .. \"/Apps/QuioShell.lua.ico\")\
      shell.run(\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Apps/QuioShell.lua /home/.\" .. user .. \"/Apps/QuioShell.lua\")\
      os.reboot()\
      \
      requesting = false\
    elseif event == \"http_failure\" then\
      term.clear()\
      term.setCursorPos(1, 1)\
      print(\"Server didn't respond. Setup is complete. Restarting...\")\
      sleep(1)\
      os.reboot()\
      requesting = false\
    end\
  end",
  [ "System/Programs/Quiologin.lua" ] = "os.fadeIn(0.05)\
term.setTextColor(colors.black)\
term.clear()\
term.setCursorPos(1,1)\
write(\"User: \")\
\
user = read()\
write(\"Password: \")\
pass = read(\"\\7\")\
os.fadeout(0.05)\
term.setTextColor(colors.white)\
term.clear()\
term.setCursorPos(1,1)\
\
if user == \"\" then\
    print(\"Wrong.\")\
    return\
end\
if not fs.exists(\"/home/.\" .. user .. \".pass.xyz\") then\
    shell.run(\"mkdir /home/.\" .. user)\
    passwrite = fs.open(\"/home/.\" .. user .. \".pass.xyz\", \"w\")\
    passwrite.write(pass)\
    passwrite.close()\
    os.setuser(user)\
    shell.run(\"/System/Programs/iconlauncher.lua\")\
end\
\
passread = fs.open(\"/home/.\" .. user .. \".pass.xyz\", \"r\")\
passrA = passread.readAll()\
if pass == passrA then\
    term.clear()\
    term.setCursorPos(1,1)\
    os.setuser(user)\
    shell.run(\"/System/Programs/iconlauncher.lua\")\
else\
    print(\"Wrong.\")\
    sleep(1)\
    return\
end\
\
term.clear()\
term.setCursorPos(1,1)\
if fs.exists(\"/home/.\" .. user) then\
    print(\"Login was successful.\")\
    os.setuser(user)\
    shell.run(\"/System/Programs/iconlauncher.lua\")\
end\
",
  [ "APIs/info.pic" ] = "\
\
\
\
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\
\
\
\
\
\
\
\
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\
",
  [ "APIs/err.pic" ] = "\
\
\
\
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\
\
\
\
\
\
\
\
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\
",
  [ "System/Programs/iconlauncher.lua" ] = "-- Declerations --\
local InstallDirectory = \"/home/.\" .. os.getuser() .. \"/Apps/\"\
\
-- images have to be 14 wide and 7 high\
\
function drawIcons(x,y)\
	term.setBackgroundColor(colors.black)\
	term.clear()\
	term.setCursorPos(1,1)\
	for i=x,y do\
		if filelist[i] ~= nil then\
			if fs.exists(InstallDirectory..filelist[i]..\".ico\") then\
				if i == x then \
					local a = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(a, 3, 2)\
					if #filelist[i] > 12 then term.setCursorPos(3,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end\
				end\
				if i == x+1 then \
					local b = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(b, 19, 2)\
					if #filelist[i] > 12 then term.setCursorPos(19,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end\
				end\
				if i == x+2 then \
					local c = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(c, 35, 2)\
					if #filelist[i] > 12 then term.setCursorPos(35,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end				\
				end\
				\
				if i == x+3 then \
					local d = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(d, 3, 10)\
					if #filelist[i] > 12 then term.setCursorPos(3,6);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end\
				end\
				\
				if i == x+4 then \
					local e = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(e, 19, 10)\
					if #filelist[i] > 12 then term.setCursorPos(19,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end \
				end\
				if i == x+5 then \
					local f = paintutils.loadImage(InstallDirectory..filelist[i]..\".ico\")\
					paintutils.drawImage(f, 35, 10)\
					if #filelist[i] > 12 then term.setCursorPos(35,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end\
				end\
			else \
				if i == x then \
					local g = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(g, 3, 2)\
					if #filelist[i] > 12 then term.setCursorPos(3,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end\
				end\
				if i == x+1 then \
					local h = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(h, 19, 2)\
					if #filelist[i] > 12 then term.setCursorPos(19,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end\
				end\
				if i == x+2 then \
					local i = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(i, 35, 2)\
					if #filelist[i] > 12 then term.setCursorPos(35,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),8);print(\" \"..filelist[i]..\" \") end				\
				end\
				\
				if i == x+3 then \
					local j = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(j, 3, 10)\
					if #filelist[i] > 12 then term.setCursorPos(3,6);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end\
				end\
				\
				if i == x+4 then \
					local k = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(k, 19, 10)\
					if #filelist[i] > 12 then term.setCursorPos(19,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end \
				end\
				if i == x+5 then \
					local l = paintutils.loadImage(InstallDirectory..\"/missing.ico\")\
					paintutils.drawImage(l, 35, 10)\
					if #filelist[i] > 12 then term.setCursorPos(35,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(\" \"..string.sub(filelist[i],1,9)..\"... \") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),16);print(\" \"..filelist[i]..\" \") end\
				end\
			end\
		end\
	end\
end\
term.clear()\
term.setCursorPos(1,1)\
\
filelist = fs.list(InstallDirectory)\
local i=1\
while i<= #filelist do\
	if string.lower(string.sub(filelist[i],#filelist[i]-3,#filelist[i])) == \".ico\" then\
		table.remove(filelist,i)\
	else i=i+1 end\
end\
\
\
currenticonnumber = 1\
while true do\
	while true do\
		drawIcons(currenticonnumber,#filelist)\
		local event,p1,p2,p3 = os.pullEvent()\
		if event == \"mouse_scroll\" then\
			if p1 == 1 and currenticonnumber +3 <= #filelist then currenticonnumber = currenticonnumber + 3\
			elseif p1 == -1 and currenticonnumber -3 >= 1 then currenticonnumber = currenticonnumber - 3 end\
			drawIcons(currenticonnumber,#filelist)\
		elseif event == \"mouse_click\" and p1 == 1  then\
			local x = p2;y = p3\
			term.setBackgroundColor(colors.black);term.setTextColor(colors.white);\
			if (x >= 3 and x <=16) and (y >=2 and y <= 8) and filelist[currenticonnumber] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber]) end\
			if (x >= 19 and x <=32) and (y >=2 and y <= 8)  and filelist[currenticonnumber+1] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+1]) end\
			if (x >= 35 and x <=48) and (y >=2 and y <= 8)  and filelist[currenticonnumber+2] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+2]) end\
			if (x >= 3 and x <=16) and (y >=10 and y <= 16)  and filelist[currenticonnumber+3] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+3]) end\
			if (x >= 19 and x <=32) and (y >=10 and y <= 16) and filelist[currenticonnumber+4] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+4]) end\
			if (x >= 35 and x <=48) and (y >=10 and y <= 16) and filelist[currenticonnumber+5] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+5]) end\
			term.clear()\
			term.setCursorPos(1,1)\
		end\
	end\
end\
",
  [ "System/Programs/.temp.update" ] = "multishell.setTitle(multishell.getCurrent(), \"update\")\
local current = term.current()\
local ok, err = load(\"local buildID = 4120\\\
term.clear()\\\
shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/buildID.txt\\\")\\\
local file = fs.open(\\\"buildID.txt\\\", \\\"r\\\")\\\
local data = file.readAll()\\\
\\\
if tonumber(data) > buildID then\\\
  os.setsuperaccess(true)\\\
  print(\\\"Updating... Please Wait...\\\")\\\
  shell.run(\\\"rm /Quiologin.lua\\\")\\\
  shell.run(\\\"rm /QuioShell.lua\\\")\\\
  shell.run(\\\"rm /update.lua\\\")\\\
  shell.run(\\\"rm /startup.lua\\\")\\\
  shell.run(\\\"rm /hometab.lua\\\")\\\
  shell.run(\\\"rm /iconlauncher.lua\\\")\\\
  shell.run(\\\"rm /mode.lua\\\")\\\
  shell.run(\\\"rm /APIs/*\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/Quiologin.lua /System/Programs/Quiologin.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/update.lua /System/Programs/update.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/QuioShell.lua /System/Programs/QuioShell.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/startup.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/iconlauncher.lua /System/Programs/iconlauncher.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/adduser.lua /System/Programs/adduser.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioAPI.lua /APIs/QuioAPI.lua\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/QuioWindow.pic /APIs/QuioWindow.pic\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/err.pic /APIs/err.pic\\\")\\\
  shell.run(\\\"wget https://raw.githubusercontent.com/kazu55/QuioShell/master/APIs/info.pic /APIs/info.pic\\\")\\\
  shell.run(\\\"rm buildID.txt\\\")\\\
  shell.run(\\\"reboot\\\")\\\
else\\\
  shell.run(\\\"rm buildID.txt\\\")\\\
end\", \"@update.lua\", nil, _ENV)\
if ok then ok, err = pcall(ok, ...) end\
term.redirect(current)\
term.setTextColor(term.isColour() and colours.yellow or colours.white)\
term.setBackgroundColor(colours.black)\
term.setCursorBlink(false)\
local _, y = term.getCursorPos()\
local _, h = term.getSize()\
if not ok then\
    printError(err)\
end\
if ok and y >= h then\
    term.scroll(1)\
end\
term.setCursorPos(1, h)\
if ok then\
    write(\"Program finished. \")\
end\
write(\"Press any key to continue\")\
os.pullEvent('key')\
",
  [ "APIs/QuioAPI.lua" ] = "textutils.centerText = function(text)\
    local x,y = term.getSize()\
    local x2, y2 = term.getCursorPos()\
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)\
    write(text)\
end\
\
os.setofflinemode = function(mode)\
    if mode then\
        offline = true\
    elseif not mode then\
        offline = false\
    end\
end\
\
os.setuser = function(user)\
    users = tostring(user)\
end\
os.getuser = function()\
    return users\
end\
\
os.getofflinemode = function()\
    return offline\
end\
\
error = function(err)\
    window = paintutils.loadImage(\"/APIs/QuioWindow.pic\")\
    errorpic = paintutils.loadImage(\"/APIs/err.pic\", 1, 1)\
    for i = 6, 11 do\
        term.setCursorPos(1, i)\
        term.clearLine()\
    end\
    paintutils.drawImage(window, 1, 1)\
    paintutils.drawImage(errorpic, 1, 1)\
    term.setCursorPos(1, 8)\
    term.setBackgroundColor(colors.white)\
    term.setTextColor(colors.black)\
    textutils.centerText(err)\
    term.setCursorPos(47,11)\
    term.setBackgroundColor(colors.lightGray)\
    print(\" OK \")\
    while true do\
        event, a, x, y = os.pullEvent(\"mouse_click\")\
        if x == 48 or x == 49 and y == 11 then\
            term.setCursorPos(47,11)\
            term.setBackgroundColor(colors.gray)\
            print(\" OK \")\
            sleep(0.25)\
            return\
        end\
    end\
end\
\
info = function(info)\
    window = paintutils.loadImage(\"/APIs/QuioWindow.pic\")\
    infopic = paintutils.loadImage(\"/APIs/info.pic\", 1, 1)\
    for i = 6, 11 do\
        term.setCursorPos(1, i)\
        term.clearLine()\
    end\
    paintutils.drawImage(window, 1, 1)\
    paintutils.drawImage(infopic, 1, 1)\
    term.setCursorPos(1, 8)\
    term.setBackgroundColor(colors.white)\
    term.setTextColor(colors.black)\
    textutils.centerText(info)\
    term.setCursorPos(47,11)\
    term.setBackgroundColor(colors.lightGray)\
    print(\" OK \")\
    while true do\
        event, a, x, y = os.pullEvent(\"mouse_click\")\
        if x == 48 or x == 49 and y == 11 then\
            term.setCursorPos(47,11)\
            term.setBackgroundColor(colors.gray)\
            print(\" OK \")\
            sleep(0.25)\
            return\
        end\
    end\
end\
\
warn = function(warn)\
    window = paintutils.loadImage(\"/APIs/QuioWindow.pic\")\
    warnpic = paintutils.loadImage(\"/APIs/warn.pic\", 1, 1)\
    for i = 6, 11 do\
        term.setCursorPos(1, i)\
        term.clearLine()\
    end\
    paintutils.drawImage(window, 1, 1)\
    paintutils.drawImage(warnpic, 1, 1)\
    term.setCursorPos(1, 8)\
    term.setBackgroundColor(colors.white)\
    term.setTextColor(colors.black)\
    textutils.centerText(warn)\
    term.setCursorPos(47,11)\
    term.setBackgroundColor(colors.lightGray)\
    print(\" OK \")\
    while true do\
        event, a, x, y = os.pullEvent(\"mouse_click\")\
        if x == 48 or x == 49 and y == 11 then\
            term.setCursorPos(47,11)\
            term.setBackgroundColor(colors.gray)\
            print(\" OK \")\
            sleep(0.25)\
            return\
        end\
    end\
end\
\
os.setsuperaccess = function(access)\
    superaccess = access\
end\
os.getsuperaccess = function()\
    return superaccess\
end",
  [ "APIs/QuioWindow.pic" ] = "\
\
\
\
\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
000000000000000000000000000000000000000000000000000\
",
}
for k, v in pairs(tmpTbl) do
if not fs.exists(fs.getDir(k)) then fs.makeDir(fs.getDir(k)) end
local h = fs.open(k, 'w')
h.write(v)
h.close()
end
--Packaged using Sam Gunner's installer maker - Version 1.2.1
