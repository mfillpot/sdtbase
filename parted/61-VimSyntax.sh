VimSyntax() {
  # Update/ Appends the necessary directive to the users .vimrc
  #  file to set syntax highlighting for slackdocs

  local VIMRC="${HOME}/.vimrc"

  # Fetch a new Syntax File
  wget ${SYNTAX_URL}/${SYNF_VIM} --output-document=${SD_DIR}/.${SYNF_VIM}

  # removes existing slackdoc syntax template lines if they exist
  sed -i /${FILETYPE}/d ${VIMRC}

  # Write the new lines to the vimrc file
  echo "\" Add a pointer to the ${FILETYPE} vim syntax file">>${VIMRC}
  echo "au BufRead,BufNewFile *.${EXTENSION} set
filetype=${FILETYPE}">>${VIMRC}
  echo "au! Syntax ${FILETYPE} source ${SD_DIR}/.${SYNF_VIM}">>${VIMRC}

  # Display a success message to the user
  PrintText 2 "${SCSTXT}" "The script has added the following lines to your
vimrc file" 1
  # Display the newly created lines
  cat ${VIMRC} | grep ${FILETYPE}
  printf "\n"
}
