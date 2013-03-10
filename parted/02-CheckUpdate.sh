CheckUpdate() {
# Checks githhub for a new version of the file and downloads it

  NEW_VERSION=$(lynx -dump ${VERSION_URL} | grep slackdoctool | cut -d "=" -f 2)
  printf "\n${BLDTXT}%s${NRMTXT}\n" \
    "Checking for an updated script."
  if [ "${NEW_VERSION}" = "${VERSION}" ]; then
    printf "\n${SCSTXT}%s${NRMTXT}\n" \
      "Your copy is up to date"
  else 
    printf "\n${BLDTXT}%s${NRMTXT}\n" \
      "A new version is available."
    read -p "Would you like to fetch version ${NEW_VERSION} [y/N]? " yn
    case ${yn} in
    [Yy*]* )
      wget ${SCRIPT_URL} --output-document=${TMP_DIR}/slackdoctool
      if [ "$?" = "0" ]; then
#SCSTXT=$(tput setaf 153)
        printf "\n${SCSTXT}%s${NRMTXT}\n" \
          "Version ${VERSION} has been saved to ${TMP_DIR}/slackdoctool."
      else
        printf "\n${ERRTXT}%s${NRMTXT}\n" \
          "The update failed, try again later."
      fi
      ;;
    * )
      printf "\n${ERRTXT}%s${NRMTXT}\n" \
        "Download Declined, terminating action."
      ;;
    esac
  fi
}
