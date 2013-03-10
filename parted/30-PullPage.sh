PullPage() {
  # Pulls the single page from $1 into the location at $2

  local EXTRACTLINE="?do=export_raw"

  # Page holds the name of the requested page
  local PAGE=${1}

  # If destination does not include ending slash add it
  if [[ ${2} == *"/" ]]; then
    local DESTDIR="${2}"
  else
    local DESTDIR="${2}/"
  fi
  

  if [ ! -d ${DESTDIR} ]; then
    PrintText 2 "${ERRTXT}" "The ${DESTDIR} directory does not exist,
terminating action" 1
    exit 1
  fi

  # if requested page includs base url remove it so output page can be 
  #  determined
  if [[ "${PAGE}" == *"${SD_URL}"* ]]; then
    local PAGE="$(echo "${PAGE}"|cut -d "/" -f 4)"
  fi

  # Set output file name
  if [ "${2}" = "${TEMPLATE_DIR}" ]; then
    local OF="$(echo "${PAGE}"|sed 's/:/-/g'|sed 's/templates-//g').${EXTENSION}"
  else
    local OF="$(echo "${PAGE}"|sed 's/:/-/g').${EXTENSION}"
  fi

  # If output file exists remove it
  if [ -e ${DESTDIR}${OF} ]; then
    rm ${DESTDIR}${OF}
  fi

  # Append the base url to the page address
  local PAGE=${SD_URL}/${PAGE}

  if [ -e ${DESTDIR}${OF} ]; then
    printf "\n${ERRTXT}%s${NRMTXT}\n" "${DESTDIR}${OF} exists"
    read -p "Would you like to overwrite it? " yn
    case ${yn} in
    [Yy]* )

      rm ${DESTDIR}${OF}

      FinishPull ${PAGE}${EXTRACTLINE} ${PAGE} ${DESTDIR}${OF}
      ;;
    * )
      printf ""
      ;;
    esac
  else
    FinishPull ${PAGE}${EXTRACTLINE} ${PAGE} ${DESTDIR}${OF}
  fi
}