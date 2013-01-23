GetSyntaxExample () {
      PullPage "wiki:syntax" ${SD_DIR}
      PrintText 0 "${NRMTXT}" "The example syntax file is now located at
${SD_DIR}/wiki-syntax.${EXTENSION}" 1
}
