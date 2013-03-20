RemoveFile () {
  # This function is intended to verbosely delete the input file and exit
  # function with and error message if the rm command fails

  # Arg 1 = File Name
  # Arg 2 = boolean for verbose output

  local VERB=""

  # Decide if the output will be verbose
  if [ "$2" = "1" ]; then
    VERB="-v"
  fi

  # IF file exists attempt to remove it
  if [ -f ${1} ]; then
    rm ${VERB} ${1}
    if [ ! "$?" = "0" ]; then
      PrintError "Could not delete ${1}, check the permissions of the parent directory"
      exit 1
    fi
  fi
}
