PrepSyntax() {
  case "${SYNAPP}" in
    vim)
      VimSyntax
      ;;
    kate)
      KateSyntax
      ;;
    *)
      PrintError "Cannot set syntax info for ${SYNAPP}, please contact the authors of slackdoctool if you want it included."
      exit 1
      ;;
  esac
}
