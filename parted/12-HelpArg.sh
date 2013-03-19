HelpArg() {
  # Defines and utilizes standard indentation and formatting to display the help arguments

  # Deinte the Option text
  local OPT="${1}"
  # Defin the Arguement text
  local ARG="${2}"
  # Define the description text
  local DISTXT="${3}"

  # Defin the standard text indendation
  local IND=8
  # Defin the indentation of the heading
  local HIND=$((${IND}-4))

  # Define the spacing that can be use
  local SPC=2

  # Display the option and argument
  PrintText ${HIND} "${BLDTXT}" "${OPT}  ${ARG}" 1

  # Display the description
  PrintText ${IND} "${NRMTXT}" "${DISTXT}" 1

}
