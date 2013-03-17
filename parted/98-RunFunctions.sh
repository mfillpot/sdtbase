RunFunctions() {
  if [ -n "${FETCHSYNTAX}" ]; then 
    GetSyntaxExample
  fi

  if [ -n "${SYNAPP}" ]; then 
    PrepSyntax
  fi

  if [ "${FETCHTEMPLATES}" = "1" ]; then 
    PullTemplates
  fi

  if [ "${LISTTEMPLATES}" = "1" ]; then 
    AvailableTemplates
  fi

  # FETCH FROM URL
  if [ -n "${GETURL}" ]; then 
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullPage
    PullPage ${GETURL} ${DESTDIR}
  fi
  
  # FETCH FROM LIST
  if [ -n "${GETFILE}" ]; then 
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullFromList
    PullFromList ${GETFILE} ${DESTDIR}
  fi

  if [ -n "${COPYFILE}" ]; then 
    CopyToClipboard "${COPYFILE}"
  fi

  if [ -n "${USETEMPLATE}" ]&&[ -n "${NEWFILE}" ]; then
    CreateNew "${USETEMPLATE}" "${NEWFILE}"
  fi

  if [ -n "${GETUPDATE}" ]; then
    CheckUpdate
  fi
}
