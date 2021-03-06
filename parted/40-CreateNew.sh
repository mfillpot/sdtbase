CreateNew() {
  # Copies a template into a new filename and sets it for editing

  # Pull the templates if they are not present
  if [ ! -d ${TEMPLATE_DIR} ]; then
    PullTemplates
  fi
  
  local TEMPLATE_FILE=${TEMPLATE_DIR}/${TEMPS[${USETEMPLATE}]}.${EXTENSION}
  local OUTPUT_FILE=${SD_DIR}/${NEWFILE}.${EXTENSION}

  if [ -f ${TEMPLATE_FILE} ]; then

    # Check if the output file already exists. If so, edit it.
    if [ -f ${OUTPUT_FILE} ]; then
      vim ${OUTPUT_FILE}
    else
      # If the output file does not exist, copy the template, rename and
      # edit it.
      cp ${TEMPLATE_FILE} ${OUTPUT_FILE} && vim ${OUTPUT_FILE}
    fi
  else
    # If template does not exist or is unaccessible then display error
    # messages
    PrintError "There have been problems accessing the template"
    PrintError "Please, list and/or refresh the templates with -r option"
    exit 1
  fi
}
