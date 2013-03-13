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
      "A new version (${NEW_VERSION}) is available."
  fi
}
