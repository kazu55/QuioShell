-- Declerations --
local InstallDirectory = "/home/." .. os.getuser() .. "/Apps/"

-- images have to be 14 wide and 7 high

function drawIcons(x,y)
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	for i=x,y do
		if filelist[i] ~= nil then
			if fs.exists(InstallDirectory..filelist[i]..".ico") then
				if i == x then 
					local a = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(a, 3, 2)
					if #filelist[i] > 12 then term.setCursorPos(3,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),8);print(" "..filelist[i].." ") end
				end
				if i == x+1 then 
					local b = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(b, 19, 2)
					if #filelist[i] > 12 then term.setCursorPos(19,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),8);print(" "..filelist[i].." ") end
				end
				if i == x+2 then 
					local c = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(c, 35, 2)
					if #filelist[i] > 12 then term.setCursorPos(35,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),8);print(" "..filelist[i].." ") end				
				end
				
				if i == x+3 then 
					local d = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(d, 3, 10)
					if #filelist[i] > 12 then term.setCursorPos(3,6);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),16);print(" "..filelist[i].." ") end
				end
				
				if i == x+4 then 
					local e = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(e, 19, 10)
					if #filelist[i] > 12 then term.setCursorPos(19,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),16);print(" "..filelist[i].." ") end 
				end
				if i == x+5 then 
					local f = paintutils.loadImage(InstallDirectory..filelist[i]..".ico")
					paintutils.drawImage(f, 35, 10)
					if #filelist[i] > 12 then term.setCursorPos(35,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),16);print(" "..filelist[i].." ") end
				end
			else 
				if i == x then 
					local g = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(g, 3, 2)
					if #filelist[i] > 12 then term.setCursorPos(3,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),8);print(" "..filelist[i].." ") end
				end
				if i == x+1 then 
					local h = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(h, 19, 2)
					if #filelist[i] > 12 then term.setCursorPos(19,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),8);print(" "..filelist[i].." ") end
				end
				if i == x+2 then 
					local i = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(i, 35, 2)
					if #filelist[i] > 12 then term.setCursorPos(35,8);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),8);print(" "..filelist[i].." ") end				
				end
				
				if i == x+3 then 
					local j = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(j, 3, 10)
					if #filelist[i] > 12 then term.setCursorPos(3,6);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(9-(#filelist[i]/2),16);print(" "..filelist[i].." ") end
				end
				
				if i == x+4 then 
					local k = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(k, 19, 10)
					if #filelist[i] > 12 then term.setCursorPos(19,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(25-(#filelist[i]/2),16);print(" "..filelist[i].." ") end 
				end
				if i == x+5 then 
					local l = paintutils.loadImage(InstallDirectory.."/missing.ico")
					paintutils.drawImage(l, 35, 10)
					if #filelist[i] > 12 then term.setCursorPos(35,16);term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);print(" "..string.sub(filelist[i],1,9).."... ") else term.setBackgroundColor(colors.gray);term.setTextColor(colors.white);term.setCursorPos(41-(#filelist[i]/2),16);print(" "..filelist[i].." ") end
				end
			end
		end
	end
end
term.clear()
term.setCursorPos(1,1)

filelist = fs.list(InstallDirectory)
local i=1
while i<= #filelist do
	if string.lower(string.sub(filelist[i],#filelist[i]-3,#filelist[i])) == ".ico" then
		table.remove(filelist,i)
	else i=i+1 end
end


currenticonnumber = 1
while true do
	while true do
		drawIcons(currenticonnumber,#filelist)
		local event,p1,p2,p3 = os.pullEvent()
		if event == "mouse_scroll" then
			if p1 == 1 and currenticonnumber +3 <= #filelist then currenticonnumber = currenticonnumber + 3
			elseif p1 == -1 and currenticonnumber -3 >= 1 then currenticonnumber = currenticonnumber - 3 end
			drawIcons(currenticonnumber,#filelist)
		elseif event == "mouse_click" and p1 == 1  then
			local x = p2;y = p3
			term.setBackgroundColor(colors.black);term.setTextColor(colors.white);
			if (x >= 3 and x <=16) and (y >=2 and y <= 8) and filelist[currenticonnumber] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber]) end
			if (x >= 19 and x <=32) and (y >=2 and y <= 8)  and filelist[currenticonnumber+1] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+1]) end
			if (x >= 35 and x <=48) and (y >=2 and y <= 8)  and filelist[currenticonnumber+2] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+2]) end
			if (x >= 3 and x <=16) and (y >=10 and y <= 16)  and filelist[currenticonnumber+3] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+3]) end
			if (x >= 19 and x <=32) and (y >=10 and y <= 16) and filelist[currenticonnumber+4] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+4]) end
			if (x >= 35 and x <=48) and (y >=10 and y <= 16) and filelist[currenticonnumber+5] ~= nil then shell.run(InstallDirectory..filelist[currenticonnumber+5]) end
			term.clear()
			term.setCursorPos(1,1)
		end
	end
end
