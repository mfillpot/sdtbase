CheckValid() {
  if [ -n "${SYNAPP}" ]; then # confirmed
  #  PrepSyntax
    case "${SYNAPP}" in 
      vim)
        SynApp=vim
        ;;
      kate)
        SynApp=kate
        ;;
      *)
        PrintError "Cannot set syntax info for ${SYNAPP}, please contact the authors of slackdoctool if you want it included."
        ISERROR=1
        ;;
    esac
  fi


  # Verify that the URL entered is not a local file or directory
  if [ -n "${GETURL}" ]&&[ -d ${GETURL} ]; then
    PrintError "Directory ${GETURL} was input into -u. A Url Must be entered"
    ISERROR=1
  elif [ -n "${GETURL}" ]&&[ -f ${GETURL} ]; then
    PrintError "File ${GETURL} was input into -u. A Url Must be entered"
    ISERROR=1
  fi

  # Verify that the FILE entered is not a local directory
  if [ -n "${GETFILE}" ]&&[ ! -f  ${GETFILE} ]; then
    PrintError "File ${GETFILE} does not exist. Cannot continue."
    ISERROR=1
  fi

  if [ -n "${DESTDIR}" ]&&[ -z "${GETFILE}" ]&&[ -z "${GETURL}" ]; then
    PrintError "Output directories are only valid when fetching URLs or a list of URLs, the option is being ignored"
  fi

  # Verify that the specified file exists
  if [ ! -f ${COPYFILE} ]; then
    PrintError "You cannot copy ${COPYFILE}, it does not exist."
    ISERROR=1
  fi
  
  # Verify that the specified template number exists
  if [ -n "${USETEMPLATE}" ]; then
    if [ ! -f "${TEMP_FILE}" ]; then
      PrintError "No template list available, use the -r option to pull the updated list of templates."
      ISERROR=1
    else
      SetTemps
      let TEMPSINDEX=${#TEMPS[@]}-1
      if [[ "${USETEMPLATE}" -gt "${TEMPSINDEX}" ]]||[[ "${USETEMPLATE}" -lt 0 ]]; then
        PrintError "No such template exists, use the -l option to list available templates."
        ISERROR=1
      fi
    fi
  fi
  
  #
  


  #NEWFILE
  # Check for existance in the function, if exists then request to overwrite

  if [ -n "${ISERROR}" ]; then
    exit 1
  fi
}