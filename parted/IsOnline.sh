IsOnline() {
  # Checks if the computer and/or github is online
  ping -c 2 www.github.com > /dev/null
  if [ $? -ne 0 ]; then
    return 1
  else
    return 0
  fi
}
