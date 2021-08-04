--[[
    Lua Shell - New Attempt

    This time it's serious. ;P
]]

local console = require("modules/console") -- Console functions
local file = require('modules/file') -- File Reader
local cfg = require("modules/config") -- Configuration
local inspect = require('modules/inspect')

cfg.loadDefault() -- Default configuration was loaded
console.set24(tonumber(cfg["cfg"]["color"]["red"]), tonumber(cfg["cfg"]["color"]["green"]), tonumber(cfg["cfg"]["color"]["blue"]))

local boot_img = [[
╔═══════════════════════════════════════════════════════════════════╗
║   CrescentShell - DEV TEST BUILD - EVERYTHING SUBJECT TO CHANGE   ║ 
╚═══════════════════════════════════════════════════════════════════╝
]]

console.clearTerm()
print(boot_img)
print("Welcome, "..cfg["cfg"]["name"].."!")

dofile("main/cli.lua")
