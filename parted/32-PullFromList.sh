PullFromList() {
  # This function is intended to allow a user to specificy a text file
  #  list of pages to retreive and pull them into the desired directory
  #
  # Arg1 = List File
  # Arg2 = Destination Dir

  local LISTFILE=${1}
  local DESTDIR=${2}
  local FETCHED=()
  local FAILED=()

  # Read each line of the input file
  while read PAG
  do
    # Pull the specified page
    PullPage "${PAG}" "${DESTDIR}" 
    # Appen page name is list dependent upon the outcome
    [ -z "${F_STATUS}" ] && FAILED+=("${PAG}") || FETCHED+=("${PAG}")
  done < ${LISTFILE}

  # Ouput the list of passes and failed documents
  # Not using printf or PrintText and it only display first value in arrays
  echo
  if [[ ${#FETCHED[@]} -ne 0 ]]; then
    echo "Fetched ${#FETCHED[@]} document(s): ${FETCHED[@]}"
  fi
  if [[ ${#FAILED[@]} -ne 0 ]]; then
    echo "Failed to fetch ${#FAILED[@]} document(s): ${FAILED[@]}"
  fi
  echo
}
