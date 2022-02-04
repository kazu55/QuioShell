while true do
    if shell.dir() == nil then
        write("/:~$ ")
        cmd = read()
        shell.run(cmd)
    else
        write(shell.dir() .. ":~$ ")
        cmd = read()
        shell.run(cmd)
    end
end
