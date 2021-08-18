--[[
    Configuration Module for CrescentShell
]]

local file = require('modules/file') -- File Reader
local inspect = require('modules/inspect')

local configuration = {
    _version = "0.5.0",
    cfg = nil,
    aliases = nil
}

local defaultConfig = {
    color = {
        blue = 255,
        green = 255,
        red = 255,
    },
    name = "DEFAULT",
    password = "",
    perms = "0"
}

function configuration.loadDefault()
    defaultSession = file.jsonRead("config/defaultSession.json")

    configTable = file.jsonRead(defaultSession["defaultPath"].."/session_info.json")
    configuration.cfg = configTable

    aliasTable = file.jsonRead(defaultSession["defaultPath"].."/aliases.json")
    configuration.aliases = aliasTable

    if configuration.cfg == nil then
        print("An error has occured, the configuration was not loaded.")
        configuration.cfg = defaultConfig
    end
    if configuration.aliases == nil then
        print("An error has occured, the aliases were not loaded and won't function.")
    end
end

function configuration.createNewConfiguration(session_name, session_user, password)
    if string.match(session_name, ";") then print("Arbitrary Code won't run here. Find a different entrance, nerd. <3") return 1 end
    if string.match(session_name, " ") then print("Session names cannot have spaces. try adding an underscore or a dash.") return 1 end
    if string.match(session_name, "default") then print("The word default is reserved. Try using Default or DEFAULT instead.") return 1 end
    
    -- prepare the variables
    
    newConfig = defaultConfig
    
    newConfig["name"] = session_user
    if password ~= nil then
        newConfig["password"] = password
    end

    -- Setup the space

    os.execute("mkdir ./config/"..session_name)
    file.jsonWrite("./config/"..session_name.."/session_info.json", newConfig)

    return true
end

function configuration.overwriteConfiguration(session_name)
    if file.isDir("./config/"..session_name) then        
        if file.jsonWrite("./config/"..session_name.."/session_info.json", configuration["cfg"]) == nil then print("Couldn't write to that file, is not a session.") return nil else return "not nil" end
    else print("Can't overwrite, create a new session before redoing") return nil end
end

function configuration.readConfiguration(session_name)
    configTable = file.jsonRead("config/"..session_name.."/session_info.json")
    configuration.cfg = configTable

    aliasTable = file.jsonRead("config/"..session_name.."/aliases.json")
    configuration.aliases = aliasTable

    if configuration.cfg == nil then
        print("An error has occured, the configuration was not loaded.")
        configuration.cfg = defaultConfig
    end
end

function configuration.changeValue(key, newValue)

end

function configuration.deleteConfiguration(session_name)
    if not file.jsonRead(session_name.."/session_info.json") ~= nil then print("Cannot delete that, if it is really a config. Delete it manually.") return false end
    if not file.jsonRead(session_name.."/aliases.json") ~= nil then print("Cannot delete that, if it is really a config. Delete it manually.") return false end
end

function configuration.saveConfiguration(session_name)
    if not configuration.cfg ~= nil then print("The config value was empty or corrupted. Saving did not commence.") return false end
    if not configuration.aliases ~= nil then print("The aliases value was empty or corrupted. Saving did not commence.") return false end

    

end

return configuration