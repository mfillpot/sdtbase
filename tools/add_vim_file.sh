#!/bin/bash

VIMRC=~/.vimrc
EXTENSION="slackdoc"
FILETYPE="slackdocs"
SYNTAXFILE="slackdocs.vim"

# Define the path to the script since the same directory
#  contains the syntax file
ABSOLUTE_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd) 

# removed existing slackdoc syntax template lines if they exist
sed -i /$FILETYPE/d $VIMRC

# Write the new lines to the vimrc file
echo "\" Add a pointer to the $FILETYPE vim syntax file">>$VIMRC
echo "au BufRead,BufNewFile *.$EXTENSION set filetype=$FILETYPE">>$VIMRC
echo "au! Syntax $FILETYPE source $ABSOLUTE_PATH/$SYNTAXFILE">>$VIMRC
