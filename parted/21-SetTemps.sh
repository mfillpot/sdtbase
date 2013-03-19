SetTemps() {
  # Sets an array with the contents of the template index file
  while read line; do
    TEMPS+=("${line}")
  done < ${TEMP_FILE}
}
