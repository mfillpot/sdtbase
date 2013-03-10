IsRoot() {
  # Check if the script is run as root
  if [ "$(id -u)" = "0" ]; then
     PrintError "Do not run the script as root."
     exit 1
  fi
}
