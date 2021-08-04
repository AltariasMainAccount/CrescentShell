# CrescentShell File Type Descriptions
This is a list of file types that are used within the source code of CrescentShell. This list may however be incomplete. Always check the source code yourself. Make issues on github if something is missing. `Use the [DOCS] tag when making issues for Documentation stuff.`

## .lua files
`.lua (Lua Files)` is the file type used for actually getting code to run within the project. The files can be formatted how ever you like, however they must use scripts from Lua 5.1 (I am aware that this is outdated.)

## .md files
`.md (Markdown Files)` are pure documentation files. This is where you should document what you did in the project or what you changed.
Not doing this can cause confusion.

## .config files
`.config (Configuration Files)` are plaintext files storing variables about certain commands. If you have any variables that need to be saved for certain stuff, this is the file type to write and read.

# Planned File Types (NOT IMPLEMENTED)
It is highly unlikely that these will manage to get into any version of CrescentShell. However they are here in case they are needed.

## .lsf files
`.lsf (Lucidum Script Files)` are used for scripting your own commands into the shell. Currently this can only be done using Lua and by rewriting the entire code of the shell. I want to avoid users from breaking their installations. This is why this feature is planned.

## .csprofile files
`.csprofile (CrescentShell Profile Files)` are files that store data about a session. This will be used if there is multiple config files and you don't know which one should be read at boot time. This will require a name login for sessions. Doesn't need any complicated password stuff since it is literally just for configuration stuff.

## .mod files 
`.mod (Modification files)` will allow the user to change command default behaviour without scripting their own version of said command. It is only planned to change the default input for the commands so that you don't get the annoying `"Command not found"` message.