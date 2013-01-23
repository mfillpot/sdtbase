PrintText() {
  # Used to output properly wrapping text with indentation and formatting.

  # Arg1 = Indent Count
  # Arg2 = Font Formatting
  # Arg3 = Input Text
  # Arg4 = 1 - newline, 0 - no newline

  INDENT=${1}
  FORMAT="${2}"
  INPUTTEXT="${3}"

  # Determine if a new line is wanted after the text
  if [ "${4}" = "1" ]; then
    NEWLINE="\n"
  else
    NEWLINE=""
  fi

  # Build strings as independent words and setting words to not wrap on new
  # lines, but anticpiate new lines between words
  NEWSTR="" 
  for WORD in ${INPUTTEXT}
  do
    if [ "${NEWSTR}" = "" ]; then
        NEWSTR="${WORD}"
    else
      TSTSTR="${NEWSTR}${WORD} "
      if [ ${#TSTSTR} -lt $(($(tput cols)-${INDENT})) ]; then 
        NEWSTR="${NEWSTR} ${WORD}"
      else
        printf "%*s" ${INDENT} ""
        printf "${FORMAT}%s${NRMTXT}${NEWLINE}" "${NEWSTR}"
        NEWSTR="${WORD}"
      fi
    fi
  done

  # Output the indent and string
  printf "%*s" ${INDENT} ""
  printf "${FORMAT}%s${NRMTXT}${NEWLINE}" "${NEWSTR}"
}
