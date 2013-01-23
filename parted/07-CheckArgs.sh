CheckArgs () {

  if [ "${#}" = "0" ]; then
    echo "no arg"
    DisplayHelp
    exit 1
  fi

while getopts ":ac:d:f:hln:o:rs:uw:ST" opt; do
    case $opt in
  h)
    DisplayHelp
    exit 0
    ;;


  S)
    FETCHSYNTAX=1
    ;;
  s)
    SYNAPP=${OPTARG}
    ;;
  T)
    FETCHTEMPLATES=1
    ;;


  w)
    GETURL=${OPTARG}
    ;;
  f)
    GETFILE=${OPTARG}
    ;;
  d)
    DESTDIR=${OPTARG}
    ;;


  c)
    COPYFILE=${OPTARG}
    ;;


  n)
    USETEMPLATE=${OPTARG}
    ;;
  o)
    NEWFILE=${OPTARG}
    ;;


  r)
    REFRESHTEMPLATES=1
    ;;
  l)
    LISTTEMPLATES=1
    ;;


  u)
    GETUPDATE=1
    ;;
  a)
    # Pull All, Prep Directory
    FETCHSYNTAX=1
    FETCHTEMPLATES=1
    ;;
  \?)
    PrintError "Invalid option:-$OPTARG"
    DisplayHelp
    exit 1
    ;;
  :)
    PrintError "Option -$OPTARG requires an argument."
    DisplayHelp
    exit 1
    ;;
  esac
done
}
