SetTemps() {
  # Sets an array with the contents of the template index 
  if [ ! -f ${TEMP_FILE} ]; then
    RefreshTemplates
  else
    TEMPS=( $(cat ${TEMP_FILE}) )
  fi
}
