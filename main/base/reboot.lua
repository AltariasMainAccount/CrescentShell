local console = require('modules/console') -- Console functions

if console.yesno("Do you really want to reboot?") then
    console.clearTerm()
    dofile("main.lua")
else
    print("Reboot cancelled.")
end