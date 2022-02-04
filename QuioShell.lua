while true do
    write(shell.dir() .. ":~$ ")
    cmd = read()
    shell.run(cmd)
end
