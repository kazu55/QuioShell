while true do
    write(user .. ":~" .. shell.dir() .. "$ ")
    cmd = read()
    shell.run(cmd)
end
