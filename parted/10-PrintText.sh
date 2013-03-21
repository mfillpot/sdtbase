PrintText() {
  # Used to output properly wrapping text with indentation and formatting.

  # Arg1 = Indent Count
  # Arg2 = Font Formatting
  # Arg3 = Input Text
  # Arg4 = 1 - newline, 0 - no newline

  local INDENT=${1}
  local FORMAT="${2}"
  local INPUTTEXT="${3}"

  # Determine if a new line is wanted after the text
  if [ "${4}" = "1" ]; then
    local NEWLINE="\n"
  else
    local NEWLINE=""
  fi

  # Build strings as independent words and setting words to not wrap on new
  # lines, but anticpiate new lines between words
  #
  # The command tput cols is fetching the colum count for the open terminal
  local NEWSTR="" 
  for WORD in ${INPUTTEXT}
  do
    if [ "${NEWSTR}" = "" ]; then
        NEWSTR="${WORD}"
    else
      local TSTSTR="${NEWSTR}${WORD} "
      if [ ${#TSTSTR} -lt $((${TERMWIDTH}-${INDENT})) ]; then 
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
