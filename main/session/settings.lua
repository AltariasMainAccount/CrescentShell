local cfg = require("modules/config") -- Configuration
local sha = require("modules/ext_mods/sha2") -- sha2

local args = ...

if args[2] == nil then
    print("No arguments given, type --help for help.")
    return nil
end

if args[2] == "--help" then
print([[
=======================================
| Settings Command for Crescent Shell |
=======================================
--help -> Opens this exact menu
--cpw <oldPass> <newPass> -> Changes the password
--rgb <r 0-255> <g 0-255> <b 0-255> -> Changes the color scheme used for the session
--cn <newName> -> Changes the Name of the session
]])
elseif args[2] == "--cn" then
    if args[3] ~= nil then
        cfg["cfg"]["name"] = args[3]
        print("Name changed to: "..args[3])
    else
        print("No name supplied.")
    end
elseif args[2] == "--cpw" then
    if args[3] ~= nil then
        local confirmSHA = sha.sha256(args[3])
        if cfg["cfg"]["password"] ~= "" then
            if cfg["cfg"]["password"] ~= confirmSHA then print("Old Password was invalid!") return nil end
            if args[4] ~= nil then
                cfg["cfg"]["password"] = sha.sha256(args[4])
                print("Password changed.")
            else
                print("No new password supplied.")
            end
        else
            cfg["cfg"]["password"] = sha.sha256(args[3])
            print("Password changed. Remember it because you'll need it next time.")            
        end
    else
        print("No name supplied.")
    end
elseif args[2] == "--rgb" then
    if args[3] ~= nil and tonumber(args[3]) then
        if args[4] ~= nil and tonumber(args[4]) then
            if args[5] ~= nil and tonumber(args[5]) then
                cfg["cfg"]["color"]["red"] = args[3]
                cfg["cfg"]["color"]["green"] = args[4]
                cfg["cfg"]["color"]["blue"] = args[5]
            else print("Blue Value missing or invalid.") return nil end
        else print("Green Value missing or invalid.") return nil end
    else print("Red Value missing or invalid.") return nil end
end