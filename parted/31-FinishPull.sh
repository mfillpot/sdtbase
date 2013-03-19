FinishPull() {
  # retrieve the page
  #
  # Arg1 = URL
  # Arg2 = Descriptive Name
  # Arg3 = Output File Name
  
  F_STATUS=""
  local URL=${1}
  local DESCRIPT=${2}
  local OUTFILE=${3}
  
  local FAILTEXT="epub_LoadScript"

  # Fetch the desired file
  wget ${URL} --output-document=${OUTFILE}

  # Test for a valid pull and display associated message
  if [ -n "$(cat ${OUTFILE}|grep ${FAILTEXT})" ]; then
    RemoveFile ${OUTFILE} 1
    PrintText 2 "${ERRTXT}" "${DESCRIPT} does not exist" 1
  unset F_STATUS
  else
    PrintText 2 "${SCSTXT}" "${OUTFILE} is ready to edit" 1
  F_STATUS=0
  fi
}
