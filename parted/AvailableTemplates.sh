AvailableTemplates() {
  # Displays a list of available templates and usage
  
  # Make sure that the TEMPS array is set
  SetTemps

  printf "\n%s\n" "To create a new document using a template type:"
  printf "\n\e[1m%s\e[0m%s\n" "slackdoctool new template_number
document_title"
  printf "\n%s\n\n" "The following templates are available:"
  
  # Loop over the TEMPS array to display available templates 
  for i in ${!TEMPS[*]}
  do
    printf "%4d: %s\n" $i ${TEMPS[$i]}
  done
  printf "\n"
}
