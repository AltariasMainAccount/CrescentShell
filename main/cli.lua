--[[
    LSH Command Line Interface
    --------------------------

    This is the core of the entire ordeal.
]]

--[[
    Module Section
    Modules get called here
]]

local console = require('modules/console')
local cfg = require('modules/config')

--[[
    Command registry
]]
local command_list = {
    -- Base Commands
    ["listcmds"] = function ()
        print("\n- CrescentShell Custom CMDS -\n\ninfo - gives info about the current build\nchangelog - gives you the changelog\ntime [shift in hour] - gives you the time in a timezone\nclear - clears the shell screen\nreboot - allows you to reboot and let changes take effect\nshutdown - exit but fancy\n")
    end,
    ["info"] = function ()
        print("Crescent Shell - 0.7.0 - Dev Build (Public Release)\n")
    end,
    ["changelog"] = function ()
        dofile("main/base/changelog.lua")
    end,
    ["settings"] = function (args)
        assert(loadfile("main/session/settings.lua"))(args)
    end,
    ["time"] = function (args)
        if args[1] ~= nil then
            if tonumber(args[1]) then
                assert(loadfile("main/base/time.lua"))(args[1])
            else
                print("Argument: 'Time Zone Shift (as Hour)' is malformed.")
            end
        else
            print("Argument: 'Time Zone Shift (as HOUR)' is missing")
        end
    end,
    ["clear"] = function ()
        console.clearTerm()
    end,
    ["reboot"] = function ()
        dofile("main/base/reboot.lua")
    end,
    ["shutdown"] = function ()
        dofile("main/base/shutdown.lua")
    end,
    ["session"] = function (args)
        assert(loadfile("main/base/session.lua"))(args)
    end,
    ["reload"] = function ()
        console.reload24()
    end,
    -- Locked Commands
    ["rm"] = function (args)
        if tonumber(cfg["cfg"]["perms"]) < 1 then print("[!] Insufficient Permission [!]") return nil end
        if args[1] == "-rf" then 
            if args[2] == "/" then
                print("Unable to execute force remove on entire hard drive.")
            elseif args[2] == "~" then
                print("To do that, please use a regular shell.")
            elseif args[2] == ".*" then
                print("Can't delete configuration files.")
            elseif args[2] == "*" then
                print("Can't delete everything from current folder.")
            else
                str = "rm "..table.concat(args, " ")..""
                console.capture(str, false) 
            end
        else 
            str = "rm "..table.concat(args, " ")..""
            console.capture(str, false)        
        end
    end,
    ["mv"] = function (args)
        if tonumber(cfg["cfg"]["perms"]) < 1 then print("[!] Insufficient Permission [!]") return nil end
        if args[1] == "/" then print("Moving the entire hard drive is locked for system safety.")
        else str = "mv "..table.concat(args, " ")..""; console.capture(str, false) end
    end,
    ["bash"] = function()
        print("[!] No. [!]")
    end 
}

--[[
    Variable Section
    Variables get initialized here
]]

isRunning = true

--[[
    Function Section
    Functions are placed here
]]

function doCommand(x, args)
    if x == nil then print("No command entered") return false end
    if command_list[x] ~= nil then
        command_list[x](args)
    else
        str = ""..x.." "..table.concat(args, " ")..""
        console.capture(str, false)
    end
end

function readCommand(x)
    -- The 2 tables, cliInput will be seperated into the proper output
    cliInput = {}
    argument_list = {}

    -- Splitting the string that is input into the shell
    counter = 1
    for i in string.gmatch(x, "%S+") do
        cliInput[counter] = i
        counter = counter + 1
    end
    
    -- split cliInput into command and argument_list
    -- Remove the first element and save it as it's own variable
    command = cliInput[1]
    table.remove(cliInput, 1)

    -- Save the rest as an argument list.
    if cliInput ~= nil then argument_list = cliInput end
    return { command, argument_list }
end

function getCommand()
    io.write("shell > ")
    input_cmd = io.read()
    
    -- Check if the input is not nil
    -- If so, execute it.
    if input_cmd ~= nil then
        sanitized = readCommand(input_cmd)
        doCommand(sanitized[1], sanitized[2])
    else
        print("Command Empty")
    end
end

--[[

    Executed Section

    The section that actually gets ran in the script.

]]

while isRunning == true do
    getCommand()
end