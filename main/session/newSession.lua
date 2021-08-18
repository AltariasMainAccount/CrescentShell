local cfg = require("modules/config") -- Configuration
local console = require("modules/console") -- Console
local sha = require("modules/ext_mods/sha2") -- sha2

local args = ...
local sessionName = args[2]

if sessionName == nil then print("[!] Session Name Empty!") return nil end

local input0 = console.getInput("Session Name")

local input1 = console.yesno("Do you want to put a password?")

if input1 then
    local input2 = console.getInput("Password")
    local sha_1 = sha.sha256(input2)

    local input2_repeat = console.getInput("Repeat Password")
    local sha_2 = sha.sha256(input2_repeat)

    if sha_1 == sha_2 then
        password = sha_1
        print("Password set.")
    else
        print("The passwords didn't match, session creation cancelled.")
        return nil 
    end
    print("Session created, Name: "..sessionName)
    cfg.createNewConfiguration(sessionName, input0, password)
else
    print("Session created, Name: "..sessionName)
    cfg.createNewConfiguration(sessionName, input0, nil)
end

