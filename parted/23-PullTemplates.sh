PullTemplates() {
  # Pulls the listed template files into the templates directory

  # Checks if the templte directory exists
  if [ ! -f "${TEMP_FILE}" ]; then
    RefreshTemplates
  else
    SetTemps
  fi

  # Fetches the templates listed in the TEMPS array.
  for TEMPLATE in "${TEMPS[@]}"
  do
    PullPage "templates:${TEMPLATE}" "${TEMPLATE_DIR}"
  done

  # Display the success message
  PrintText 2 "${SCSTXT}" "All templates have been successfully retrieved." 1
}
