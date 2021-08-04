local console = {
    _version = "0.9.0"
}

-- New Output System (Based heavily on JS) --

function console.set8(color)
    print(string.char(27).."[38;5;"..color.."m")
end

function console.set24(r, g, b)
    print(string.char(27).."[38;2;" ..r..";" ..g.. ";" ..b.. "m")
end

-- Custom Inputs for variable detection

function console.yesno(question)
    print(question.." [Y/N]")
    local input = io.read()
    local san_input = string.lower(input)

    if san_input == "y" or san_input == "yes" then
        return true
    else
        return false
    end
end

-- Functions for useability cases

function console.clearTerm()
    io.write(string.char(27).."[H"..string.char(27).."[2J")
end

function console.clearLine() -- For some reason, this will never work.
    io.write(string.char(27).."[K"..string.char(27).."[999D")
end

function console.pause(n) -- n in milliseconds  
    local ntime = os.clock() + n/1000
    repeat until os.clock() > ntime
end

-- Extra functions, probably won't have a use case.

function console.getOperatingSystemName()
    local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
        if BinaryFormat == "dll" then
                return "Windows"
        elseif BinaryFormat == "so" then
                return "Linux Distro"
        elseif BinaryFormat == "dylib" then
                return "MacOS"
        end
end

function console.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\r]+', '')
  print(s)
  return s
end

return console