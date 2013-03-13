BuildStructure() 
{
  # Accepts no arguments, builds directory structure

  if [ ! -d ${TEMPLATE_DIR} ]; then
    PrintText 0 "${ERRTXT}" "The user directory at ${SD_DIR} \
      does not exist" 1
    read -p "Would you like to create it? (Y/N) :" yn
    case ${yn} in
      [Yy*]* )
        mkdir -v ${SD_DIR}
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
