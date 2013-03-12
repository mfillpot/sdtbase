DisplayHelp() {
PrintText 4 "${SCSTXT}" "Slackware Documentation Project - Off-line Tools" 1
PrintText 4 "${BLDTXT}" "Version: ${VERSION}" 1
PrintText 0 "" "" 1
PrintText 6 "${BLDTXT}" "Slackdocs Website:" 1
PrintText 8 "${NRMTXT}" "http://docs.slackware.com" 1
PrintText 6 "${BLDTXT}" "Project URL:" 1
PrintText 8 "${NRMTXT}" "https://github.com/mfillpot/slackdoctool" 1
PrintText 0 "" "" 1

PrintText 0 "${BLDTXT}" "OPTIONS" 1

HelpArg "-h" "" "Display this dialog"
HelpArg "-S" "" "Fetch the syntax file(s)."
HelpArg "-s" "string" "Apply the syntax highlighting file for the chosen application. Valid options are kate and vim."
HelpArg "-T" "" "Fetch all templates from the website"
HelpArg "-w" "sring" "Fetch an article from the slackdocs URL given. If the -d argument is not given it will save in the slackdocs directory."
HelpArg "-f" "file" "Fetch articles from the slackdocs wiki from the list contained within the specified file. If no -d option is given it will save the documents into the slackdocs directory."
HelpArg "-d" "string" " Only valid with the -f and -w arguments. This specifies the destination directory which will contain the fetched file(s)."
HelpArg "-c" "string" "Copy the selected file's contents into the clipboard."
HelpArg "-n" "number" "Create a new file based upon the specified template. The template list can be viewed with the -l option."
HelpArg "-o" "string" "Only used with the -n option. The argument will contain the name of the new output file."
HelpArg "-r" "" "Refresh the list of templates from the slackdocs wiki."
HelpArg "-l" "" "List all available templates."
HelpArg "-u" "" "Check for and download updates to this script."
HelpArg "-a" "" "Download all base and syntax files from the slackdocs wiki."
}
