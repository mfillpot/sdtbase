AvailableTemplates() {
  # Displays a list of available templates and usage

  # Make sure the template file exists and the TEMPS array is set
  if [ ! -f "${TEMP_FILE}" ]; then
    # The RefreshTemplates function included SetTemps
    RefreshTemplates
  else
    SetTemps
  fi

  PrintText 0 "${BLDTXT}" "The following templates are available:" 1
  
  # Loop over the TEMPS array to display available templates 
  # Continue to use printf as the Writext function creates errors with array
  # values
  for i in ${!TEMPS[*]}
  do
    printf "%4d: %s\n" $i ${TEMPS[$i]}
  done
  printf "\n"
}
