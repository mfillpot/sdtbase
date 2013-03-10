RefreshTemplates() {
  # Refresh the list of available templates
  
  PrintText 2 "${BLDTXT}"  "Refreshing the list of available templates..." 1
  lynx -dump ${TEMP_URL} | awk -F: '/templates:/ {print $NF}'>${TEMP_FILE}
  
  # Make the order of the templates more structured
  sort ${TEMP_FILE} -o ${TEMP_FILE}

  # Populates the TEMPS array with a list of available templates
  SetTemps
}
