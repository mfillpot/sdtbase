RunFunctions() {
  if [ -n "${FETCHSYNTAX}" ]; then # confirmed
    GetSyntaxExample
  fi

  if [ -n "${SYNAPP}" ]; then # confirmed
    PrepSyntax
  fi

  #REFRESHTEMPLATES
  if [ "${FETCHTEMPLATES}" = "1" ]; then # confirmed
    PullTemplates
  fi

  #LISTTEMPLATES
  if [ "${LISTTEMPLATES}" = "1" ]; then # confirmed
    AvailableTemplates
  fi

  # FETCH FROM URL
  if [ -n "${GETURL}" ]; then # confirmed
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullPage
    PullPage ${GETURL} ${DESTDIR}
  fi
  
  # FETCH FROM LIST
  if [ -n "${GETFILE}" ]; then # confirmed
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullFromList
    PullFromList ${GETFILE} ${DESTDIR}
  fi

  #COPYFILE
  if [ -n "${COPYFILE}" ]; then # confirmed
    CopyToClipboard "${COPYFILE}"
  fi

  #USETEMPLATE
  if [ -n "${USETEMPLATE}" ]&&[ -n "${NEWFILE}" ]; then
    CreateNew "${USETEMPLATE}" "${NEWFILE}"
  fi

  #NEWFILE

  if [ -n "${GETUPDATE}" ]; then
    CheckUpdate
  fi
}
