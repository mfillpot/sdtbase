DisplayHelp() {
# Displays the help text

  PrintText 4 "${SCSTXT}" "Slackware Documentation Project - Off-line Tools" 1
  PrintText 4 "${BLDTXT}" "Version: ${VERSION}" 1
  PrintText 0 "" "" 1
  PrintText 6 "${BLDTXT}" "Slackdocs Website:" 1
  PrintText 8 "${NRMTXT}" "http://docs.slackware.com" 1
  PrintText 6 "${BLDTXT}" "Project URL:" 1
  PrintText 8 "${NRMTXT}" "https://github.com/mfillpot/slackdoc_templates" 1
  PrintText 0 "" "" 1

  PrintText 0 "${BLDTXT}" "OPTIONS" 1
  HelpArg "-h" "" "Display this dialog"
  HelpArg "-S" "" "Fetch the syntax file(s)."
  HelpArg "-s" "Application Name" "Apply the syntax highlighting file for the chosen application. Valid options are kate and vim."
  HelpArg "-T" "" "Fetch all templates from the website"
  HelpArg "-w" "URL" "Fetch an article from the slackdocs URL given. If the -d argument is not given it will save in the slackdocs directory."
  HelpArg "-f" "File" "Fetch articles from the slackdocs wiki from the list contained within the specified file. If no -d option is given it will save the documents into the slackdocs directory."
  HelpArg "-d" "Destination Directory" "Only valid with the -f and -w arguments. This specifies the destination directory which will contain the fetched file(s)."
  HelpArg "-c" "Copy From File" "Copy the file's contents into the clipboard."
  HelpArg "-n" "Template Number" "Create a new file based upon the specified template. The template list can be viewed with the -l option."
  HelpArg "-o" "Output FileName" "Only used with the -n option. The argument will contain the name of the new output file."
  HelpArg "-r" "" "Refresh the list of templates from the slackdocs wiki."
  HelpArg "-l" "" "List all available templates."
  HelpArg "-u" "" "Check for and download updates to this script."
  HelpArg "-a" "" "Download all base and syntax files from the slackdocs wiki."
}
