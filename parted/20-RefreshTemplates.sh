RefreshTemplates() {
  # Refresh the list of available templates

  # Display a message to the user stating upcoming action  
  PrintText 2 "${BLDTXT}"  "Refreshing the list of available templates..." 1

  # Fetch the list of templates and store in local template file
  lynx -dump ${TEMP_URL} | awk -F: '/templates:/ {print $NF}'>${TEMP_FILE}
  
  # Make the order of the templates more structured
  sort ${TEMP_FILE} -o ${TEMP_FILE}

  # Populates the TEMPS array with a list of available templates
  SetTemps
}
