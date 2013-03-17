CopyToClipboard()
{
  # Copies a file to the clipboard for pasteing online
  #
  # Arg1 = File Name
  # Arg2 = 1 to turn confirmations ON, else confirmations OFF

  local FILENAME=${1}
  local CONFS=${2}


  # Test to see if xclip is installed, if false display error and exit
  ls /var/log/packages | grep "\<xclip\>" > /dev/null
  if [ ! $? -eq 0 ]; then
    printf "\n${ERRTXT}%s${NRMTXT}\n" \
      "xclip is not installed, the contents will need to be manually copied."
    exit 1
  fi

  # If file exists Start copy process
  if [ -f ${FILENAME} ]
  then
    if [ "${CONFS}" = "1" ]
    then
      # if xclip is installed on the system, 
      # copy the contents of the file to clipboard
      read -p "Would you like the contents of ${FILENAME} to be copied to the
clipboard [y/N]? " yn
      case ${yn} in
      [Yy*]* )
        cat ${FILENAME} | xclip -selection clipboard
        printf "\n${SCSTXT}%s${NRMTXT}\n" \
          "The contents of ${FILENAME} has been copied to clipboard."
        return 1
        ;;
      esac
    else
      cat ${FILENAME} | xclip -selection clipboard
    fi
  else
    printf "\n${ERRTXT}%s${NRMTXT}\n" \
      "The File ${FILENAME} does not exist, terminating action."
    exit 1
  fi
}
