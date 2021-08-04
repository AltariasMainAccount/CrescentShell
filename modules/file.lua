-- http://lua-users.org/wiki/FileInputOutput
-- Note to self: Stop using local, fucks everything over.

local json = assert(loadfile "modules/ext_mods/json.lua")() -- JSON to Lua Table & Backwards

local file = { 
    _version = "1.0.0"
}

-- Local Functions (don't exit the scope)

function fileExt(filename) return filename:match("(%.%w+)$") or "" end

function getFilename(filepath) return filepath:match("^.+/(.+)$") end

function isExt(filepath, ext)
    check = fileExt(getFilename(filepath))
    if check == ext then return true 
    else return false end
end

-- Functions that go outside as module functions.

function file.read(filepath)
    raw_data = io.open("./"..filepath, "r")
    -- Check if it could open the file
    if not raw_data then return nil end
    -- Read the file into a variable and close it
    string = raw_data:read("*a")
    raw_data:close()
    -- return the jsonString variable
    return string
end

function file.write(filepath)

end

function file.jsonRead(filepath)
    raw_data = io.open("./"..filepath, "r")
    -- Check if it could open the file and if it is indeed a JSON file.
    if not raw_data then return nil end
    if not isExt(filepath, ".json") then return nil end
    -- Read the file into a variable and close it
    jsonString = raw_data:read("*a")
    raw_data:close()
    -- decode json to lua table and return that
    data_table = json:decode(jsonString)

    return data_table
end

function file.jsonWrite(filepath)

end

return file