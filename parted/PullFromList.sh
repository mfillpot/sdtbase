PullFromList() {
  # This function is intended to allow a user to specificy a text file
  #  list of pages to retreive and pull them into the desired directory
  #
  # Arg1 = List File
  # Arg2 = Destination Dir

  local LISTFILE=${1}
  local DESTDIR=${2}
  declare -a FETCHED=()
  declare -a FAILED=()
  
  while read PAG
  do
    PullPage ${PAG} ${DESTDIR} 
    [ -z "$F_STATUS" ] && FAILED+=("${PAG}") || FETCHED+=("${PAG}")
  done < ${LISTFILE}
  echo 
  echo "Fetched ${#FETCHED[@]} document(s): ${FETCHED[@]}"
  echo "Failed to fetch ${#FAILED[@]} document(s): ${FAILED[@]}"
  echo
}
