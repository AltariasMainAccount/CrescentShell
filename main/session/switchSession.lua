local cfg = require("modules/config") -- Configuration
local console = require("modules/console") -- Console
local sha = require("modules/ext_mods/sha2") -- sha2
local inspect = require("modules/inspect")


local args = ...

print(inspect(args))

local sessionName = args[2]

if sessionName == nil then print("[!] Session Name Empty!") return nil end
cfg.readConfiguration(sessionName)

if cfg["cfg"]["password"] == "" then
    cfg.readConfiguration(sessionName)
else
    local check = console.getInput("Password")
    local confirmSHA = sha.sha256(check)
    if cfg["cfg"]["password"] == confirmSHA then
        print("Welcome, "..cfg["cfg"]["name"])
    else
        cfg.loadDefault()
        print("The password did not match, please try again.")
    end
end