BuildStructure() 
{
  # Accepts no arguments, builds directory structure

  if [ ! -d ${TEMPLATE_DIR} ]; then
    PrintText 0 "${ERRTXT}" "The user directory at ${SD_DIR} \
      does not exist" 1
    read -p "Would you like to create it? (Y/N) :" yn
    case ${yn} in
      [Yy*]* )
        mkdir -pv ${SD_DIR}
        if [ ! "$?" = "0" ]; then
          printerror "Could not make ${SD_DIR}, check the permissions of the parent firectory"
          exit 1
        fi
        if [ ! -d ${TEMPLATE_DIR} ]; then
          mkdir -v ${TEMPLATE_DIR}
        fi
        ;;
      * )
        PrintError "Cannot resume without directory in place, Terminating."
        exit 1
        ;;
    esac
  fi
}
