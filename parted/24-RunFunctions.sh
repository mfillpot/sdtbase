RunFunctions() {
  if [ -n "${FETCHSYNTAX}" ]; then # confirmed
    GetSyntaxExample
    #echo "Fetch Syntax"
  fi

  if [ -n "${SYNAPP}" ]; then # confirmed
  #  PrepSyntax
    echo "Set Syntax for ${SYNAPP}"
  fi

  #REFRESHTEMPLATES
  if [ "${FETCHTEMPLATES}" = "1" ]; then
    PullTemplates
  fi

  #LISTTEMPLATES
  if [ "${LISTTEMPLATES}" = "1" ]; then
    AvailableTemplates
  fi

  if [ -n "${GETURL}" ]; then
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullPage
    PullPage ${GETURL} ${DESTDIR}
  fi

  if [ -n "${GETFILE}" ]; then
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullFromList
    PullFromList ${GETFILE} ${DESTDIR}
  fi

  #COPYFILE

  #USETEMPLATE
  #NEWFILE

  if [ -n "${GETUPDATE}" ]; then
  #  CheckUpdate
    echo "Check for an update"
  fi
}
