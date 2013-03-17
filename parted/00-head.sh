# Author: Matthew Fillpot
# Created: 2012-12-28
# License: BSD
#
# Do not change version number, it is changes based upon git tags
VERSION=0.1.2
#
# Description
# -------------------------------------------------------
# Toolkit used to simplify offline editing of slackdocs
#  wiki content for http://docs.slackware.com
#

# Define the variables
EXTENSION="slackdoc"
FILETYPE="slackdocs"
SYNF_VIM="slackdocs.vim"
SD_DIR="${HOME}/slackdocs"
TEMPLATE_DIR="${SD_DIR}/templates"

# Currently pointing tomf_test, needs to be movedto master when stable
GIT_URL="https://raw.github.com/mfillpot/slackdoctool/master"
VERSION_URL="${GIT_URL}/versions.txt"
SCRIPT_URL="${GIT_URL}/slackdoctool"
SOURCE_URL="https://raw.github.com/mfillpot/sdtbase/master"
SYNTAX_URL="${SOURCE_URL}/syntax_files"

SD_URL="http://docs.slackware.com"
TEMP_URL="${SD_URL}/wiki:user:mfillpot:template_list"
TEMP_FILE="${SD_DIR}/templates.txt"

# Set Output font colors
BLDTXT=$(tput bold)
NRMTXT=$(tput sgr0)
ERRTXT=$(tput setaf 1)
SCSTXT=$(tput setaf 2)

