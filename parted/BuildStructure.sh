BuildStructure() 
{
  # Accepts no arguments, builds directory structure

  if [ ! -d ${TEMPLATE_DIR} ]; then
    printf "\n${ERRTXT}%s${NRMTXT}\n" "The user directory at ${SD_DIR} does
not exist"
    read -p "Would you like to create it? (Y/N) :" yn
    case ${yn} in
    [Yy*]* )
      mkdir -v ${SD_DIR}
      if [ ! -d ${TEMPLATE_DIR} ]; then
        mkdir -v ${TEMPLATE_DIR}
      fi
      ;;
    * )
      printf "\n${ERRTXT}%s${NRMTXT}\n" "Cannot resume without directory in
place, Terminating."
      exit 1
      ;;
    esac
  fi
}
