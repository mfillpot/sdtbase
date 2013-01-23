RunFunctions() {
  if [ -n "${FETCHSYNTAX}" ]; then # confirmed
    GetSyntaxExample
    #echo "Fetch Syntax"
  fi

  if [ -n "${SYNAPP}" ]; then # confirmed
  #  PrepSyntax
    echo "Set Syntax for ${SYNAPP}"
  fi

  exit 1
  #REFRESHTEMPLATES
  if [ "${FETCHTEMPLATES}" = "1" ]; then
  #  PullTemplates
    echo "Pull the Templates"
  fi
  #LISTTEMPLATES

  if [ -n "${GETURL}" ]; then
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
  #  PullPage
    echo "Pull Page ${GETURL} into ${DESTDIR}"
  fi

  if [ -n "${GETFILE}" ]; then
    # If no destination directory is added default to the slackdoc dir
    if [ -z "${DESTDIR}" ]; then
      DESTDIR=${SD_DIR}
    fi
    #  PullFromList
    echo "Pull Pages from ${GETFILE} into ${DESTDIR}"
  fi

  #COPYFILE

  #USETEMPLATE
  #NEWFILE

  if [ -n "${GETUPDATE} ]"; then
  #  CheckUpdate
    echo "Check for an update"
  fi
}
