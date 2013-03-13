# Author: Matthew Fillpot
# Created: 2012-12-28
# License: BSD
VERSION="0.1.1"
#
# Description
# -------------------------------------------------------
# Toolkit used to simplify offline editing of slackdocs
#  wiki content for http://docs.slackware.com
#


#------ TODO List -------
#   1. See if the script is causing terminal wrapping issues from font colors
#   and fix them
#   12. Add a page to the wiki with vim optimizations and refer to them in
#   the script
#   13. Clean up the script
#   14. Add hooks for IsOnline where appropriate
#   15. Make a function to write list of templates into an array using the
#     read line function
#   15. Change SetTemps to use the function to set templates
#   16. Change RefreshTemplates to use the function to set templates

# Define the variables
EXTENSION="slackdoc"
FILETYPE="slackdocs"
SYNF_VIM="slackdocs.vim"
SD_DIR="${HOME}/slackdocs"
TEMPLATE_DIR="${SD_DIR}/templates"
#TEMPLATE_IND=""
#DOC_TITLE=${DOC_TITLE:-"new"}

# Currently pointing tomf_test, needs to be movedto master when stable
GIT_URL="https://raw.github.com/mfillpot/slackdoctool"
VERSION_URL="${GIT_URL}/versions.txt"
SCRIPT_URL="${GIT_URL}/slackdoctool"
SOURCE_URL="https://raw.github.com/mfillpot/sdtbase"
SYNTAX_URL="${SOURCE_URL}/syntax_files"

SD_URL="http://docs.slackware.com"
TEMP_URL="${SD_URL}/wiki:user:mfillpot:template_list"
TEMP_FILE="${SD_DIR}/templates.txt"

# Set Output font colors
BLDTXT=$(tput bold)
NRMTXT=$(tput sgr0)
ERRTXT=$(tput setaf 1)
SCSTXT=$(tput setaf 2)

#BLACK=$(tput setaf 0)
#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
#YELLOW=$(tput setaf 3)
#LIME_YELLOW=$(tput setaf 190)
#POWDER_BLUE=$(tput setaf 153)
#BLUE=$(tput setaf 4)
#MAGENTA=$(tput setaf 5)
#CYAN=$(tput setaf 6)
#WHITE=$(tput setaf 7)
#BRIGHT=$(tput bold)
#NORMAL=$(tput sgr0)
#BLINK=$(tput blink)
#REVERSE=$(tput smso)
#UNDERLINE=$(tput smul)
