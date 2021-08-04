local args = {...}
local shifthour = args[1]

timeshift = shifthour * 60 * 60

prettyNow24 = os.date('%A, %B %d %Y at %H:%M:%S', os.time() + timeshift)
prettyNow12 = os.date('%A, %B %d %Y at %I:%M:%S %p', os.time() + timeshift)
print("24 Hour Clock: "..prettyNow24.."\n12 Hour Clock: "..prettyNow12)