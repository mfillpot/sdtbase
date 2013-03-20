GetSyntaxExample () {
  # Fetch the Syntax file
  PullPage "wiki:syntax" ${SD_DIR}

  # Print a success message
  PrintText 0 "" "" 1
  PrintText 0 "${NRMTXT}" "The example syntax file is now located at ${SD_DIR}/wiki-syntax.${EXTENSION}" 1
}
