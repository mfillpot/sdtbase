MakeDir () {
  # This function is intended to verbosely build the input directory and exit
  # function with and error message if the mkdir command fails

  mkdir -pv ${1}
  if [ ! "$?" = "0" ]; then
    PrintError "Could not make ${1}, check the permissions of the parent directory"
    exit 1
  fi
}
