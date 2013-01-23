CreateNew() {
  # Copies a template into a new filename and sets it for editing

  
  BuildStructure

  # Pull the templates if they are not present
  if [ ! -d ${TEMPLATE_DIR} ]; then
    PullTemplates
  fi
  
  TEMPLATE_FILE=${TEMPLATE_DIR}/${TEMPS[${TEMPLATE_IND}]}.${EXTENSION}
  OUTPUT_FILE=${SD_DIR}/${DOC_TITLE}.${EXTENSION}

  if [ -f ${TEMPLATE_FILE} ]; then

    # Question: Why are the files being copied into the clipboard and opened
    # in vim?

    # Check if the output file already exists. If so, edit it.
    if [ -f ${OUTPUT_FILE} ]; then
      vim ${OUTPUT_FILE}
      CopyToClipboard ${OUTPUT_FILE} "1"

      # If the output file does not exist, copy the template, rename and
      # edit it.
    else
      cp ${TEMPLATE_FILE} ${OUTPUT_FILE} && vim ${OUTPUT_FILE}
      CopyToClipboard ${OUTPUT_FILE} "1"
    fi
  else
    printf "\n${ERRTXT}%s${NRMTXT}\n" \
      "There have been problems accessing ${TEMPLATE_FILE}"
    printf "${NRMTXT}%s${BLDTXT} %s${NRMTXT}\n" \
      "Please download template files first by running:" \
        "slackdoctool fetch templates"
    exit 1
  fi
}
