# Ideas

## CLI Improvements (in form of Session Settings)

### Program Execution (session setting `customPrograms: false`)
If this setting is set to false, the shell will be using the regular environment to run all the commands. None of the custom commands will be loaded.
The CLI will only be used for interacting with the system through `io.popen()` or `os.execute()`.
If it is set to true it will first go through the custom commands before going for an `io.popen()` (**WILL ONLY HAPPEN IF pipeProgram IS TRUE**)

### Program Pipeline (session setting `pipeProgram: true`)
If this setting is set to true, it will try and use commands that the CLI doesn't recognize within your system environment. This will allow you to use `ls` for example.
This setting doesn't do anything when `customPrograms` is set to false. If this is set to false, the system will only recognize the custom commands.

### Permission System (within the `session_info.json` file)
This thing will allow you to give sessions certain rights over your system.

`0 = No special rights | 1 = Shell is allowed to read files (useful for cat and stuff) | 2 = Shell is allowed to READ and WRITE files (useful for copying files/editing files) | 3 = Shell is allowed to edit, write and read files. | 4 = Shell has SUDO permissions.`

Running the shell without sudo will give you an error when you try to log into a session that has the permission set to 4.