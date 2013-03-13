SetTemps() {
  # Sets an array with the contents of the template index 
  TEMPS=()
  while read line; do
    TEMPS+=("${line}")
  done < ${TEMP_FILE}
}
