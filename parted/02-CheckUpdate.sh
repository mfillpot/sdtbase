CheckUpdate() {
# Checks githhub for a new version of the file and downloads it

  # Display a message indicating that the script is checking for a new
  # version
  PrintText 2 "${BLDTXT}" "Checking for an updated script." 1

  # get the new version number from the repo
  local NEW_VERSION=$(lynx -dump ${VERSION_URL} | grep slackdoctool | cut -d "=" -f 2)

  # Test to see if an update is available, display a message indicatin the
  # status
  if [ "${NEW_VERSION}" = "${VERSION}" ]; then
    PrintText 2 "${SCSTXT}" "Your copy is up to date" 1
  else 
    PrintText 2 "${BLDTXT}" "A new version (${NEW_VERSION}) is available." 1
  fi
}
