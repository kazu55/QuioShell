while true do
    if shell.dir() == "" then
        write("/:~$ ")
        cmd = read()
        shell.run(cmd)
    else
        write(shell.dir() .. ":~$ ")
        cmd = read()
        shell.run(cmd)
    end
end
