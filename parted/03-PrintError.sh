PrintError() {
  # Arg1 = Text To Display

  #Writes the string in the error color with a blank line following it

  local ERROR_TEXT="${1}"

  PrintText 2 "${ERRTXT}" "${ERROR_TEXT}" 1
  PrintText 0 "" "" 1
}
