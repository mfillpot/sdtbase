BuildStructure() 
{
  # Accepts no arguments, builds directory structure

  # Tests if the directory does not exists
  # if true build structure
  # if false do nothing
  if [ ! -d ${TEMPLATE_DIR} ]; then

    # Display message indicating the directory does not exist
    PrintText 0 "${ERRTXT}" "The user directory at ${SD_DIR} \
      does not exist" 1

    # Prompt the user for creation and perform necessary actions
    read -p "Would you like to create it? (Y/N) :" yn
    case ${yn} in
      [Yy*]* )
        # make the necessary directory
        MakeDir ${SD_DIR}

        if [ ! -d ${TEMPLATE_DIR} ]; then
          MakeDir ${TEMPLATE_DIR}
        fi
        ;;
      * )
        PrintError "Cannot resume without directory in place, Terminating."
        exit 1
        ;;
    esac
  fi
}
