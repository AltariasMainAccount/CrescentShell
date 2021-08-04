local console = require('modules/console') -- Console functions

if console.yesno("Do you really want to shutdown?") then
    isRunning = false
    console.clearTerm()
    print("Goodbye.")
else
    print("Shutdown cancelled.")
end