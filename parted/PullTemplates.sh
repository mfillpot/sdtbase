PullTemplates() {
  # Pulls the listed template files into the templates directory

  # Checks if the templte directory exists
  if [ ! -d ${TEMPLATE_DIR} ]; then
    mkdir ${TEMPLATE_DIR}
  fi
  
  # Populates the TEMPS array
  SetTemps

  # Pulls the templates listed in the TEMPS array.
  for TEMPLATE in "${TEMPS[@]}"
  do
    PullPage "templates:${TEMPLATE}" "${TEMPLATE_DIR}"
  done
  PrintText 2 "${SCSTXT}" "All templates have been successfully retrieved." 1
}
