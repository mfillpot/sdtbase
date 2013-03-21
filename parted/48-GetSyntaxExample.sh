GetSyntaxExample () {
  # Fetch the Syntax file
  PullPage "wiki:syntax" ${SD_DIR}

  # Print a success message
  printf "\n"
  PrintText 0 "${NRMTXT}" "The example syntax file is now located at ${SD_DIR}/wiki-syntax.${EXTENSION}" 1
}
