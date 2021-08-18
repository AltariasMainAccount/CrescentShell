local cfg = require("modules/config") -- Configuration
local sha = require("modules/ext_mods/sha2") -- sha2

local args = ...
local sessionName = args[2]

if sessionName == nil then print("[!] Session Name Empty!") return nil end
if sessionName == "default" then print("[!] Cannot overwrite default configuration!") return nil end

if cfg.overwriteConfiguration(sessionName) ~= nil then
    print("Session overwritten with current session info.")
else
    print("Something went wrong during the process of overwriting.")
end