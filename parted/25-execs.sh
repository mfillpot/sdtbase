#DisplayHelp
#exit 1

# Check if run as root, if root then exit
IsRoot

# Test all Arguments
CheckArgs "$@"

# Verify that no invalid arguments are given
CheckValid

exit 0
# If no errors, then run the functions
RunFunctions

# If it succeeds until now it processed successfully
exit 0
