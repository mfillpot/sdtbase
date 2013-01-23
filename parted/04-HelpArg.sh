HelpArg() {

  OPT="${1}"
  ARG="${2}"
  DISTXT="${3}"

  # Defines and utilizes standard indentation and formatting to display the help arguments

  IND=8
  HIND=$((${IND}-4))
  SPC=2

  PrintText ${HIND} "${BLDTXT}" "${OPT}  ${ARG}" 1
  PrintText ${IND} "${NRMTXT}" "${DISTXT}" 1

}
