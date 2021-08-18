-- Get all the modules necessary
local cfg = require("modules/config") -- Configuration
local console = require("modules/console") -- Console
local sha = require("modules/ext_mods/sha2") -- sha2

-- Variable declaration
local args = ...
local argsKey = args[1] -- something like "--save"
local sessionName = args[2]

-- Design stuff

local help = [[
╔═════════════════════════╦══════════════════════════════════════════════════════╗
║   Session System Help   ║                                                      ║
╠════════════╤════════════╝                                                      ║
║ --help     ┆ Shows this fancy looking thing with box-drawing characters.       ║
║ --new      ┆ Creates a new session with the help of the given session name.    ║
║ --switch   ┆ Switches to another session given by a name.                      ║
║ --save     ┆ Saves the current given settings to the current session_info file ║
║ --me       ┆ Shows the name given to your current session.                     ║
║ --settings ┆ Opens the settings application. That's it.                        ║
╚════════════╧═══════════════════════════════════════════════════════════════════╝
For more help to the individual keywords, do "--help <keyword>".
]]


-- Code
if argsKey == "--help" then
    print(help)
elseif argsKey == "--new" then
    assert(loadfile("main/session/newSession.lua"))(args)
elseif argsKey == "--switch" then
    assert(loadfile("main/session/switchSession.lua"))(args)
elseif argsKey == "--save" then
    assert(loadfile("main/session/saveSession.lua"))(args)
elseif argsKey == "--me" then
    print(cfg["cfg"]["name"])
elseif argsKey == "--settings" then
    assert(loadfile("main/session/settings.lua"))(args)
end