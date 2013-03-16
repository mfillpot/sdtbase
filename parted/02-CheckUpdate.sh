CheckUpdate() {
# Checks githhub for a new version of the file and downloads it

  # Display a message indicating that the script is checking for a new
  # version
  printf "\n${BLDTXT}%s${NRMTXT}\n" \
    "Checking for an updated script."

  # get the new version number from the repo
  NEW_VERSION=$(lynx -dump ${VERSION_URL} | grep slackdoctool | cut -d "=" -f 2)

  # Test to see if an update is available, display a message indicatin the
  # status
  if [ "${NEW_VERSION}" = "${VERSION}" ]; then
    printf "\n${SCSTXT}%s${NRMTXT}\n" \
      "Your copy is up to date"
  else 
    printf "\n${BLDTXT}%s${NRMTXT}\n" \
      "A new version (${NEW_VERSION}) is available."
  fi
}
