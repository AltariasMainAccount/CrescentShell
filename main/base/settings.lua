local cfg = require("modules/config") -- Configuration

local a = ...

if a[1] == nil then
    print("No arguments given, type -help for help.")
end

if a[1] == "-help" then
    print([[
=======================================
| Settings Command for Crescent Shell |
=======================================
-help -> Opens this exact menu
-cpw <oldPass> <newPass> -> Changes the password (this doesn't do anything yet)
-rgb <r 0-255> <g 0-255> <b 0-255> -> Changes the color scheme used for the session
-cn <newName> -> Changes the Name of the session
    ]])
end

if a[1] == "-cn" then
    if a[2] ~= nil then
        cfg["cfg"]
    else
        print("No name supplied")