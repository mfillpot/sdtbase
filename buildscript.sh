#!/bin/bash

APPNAME=slackdoctool

CWD=`pwd`
PARTDIR=${CWD}/parted
ORG=${PARTDIR}/org.lst
OF=${CWD}/${APPNAME}
ARGFILE=${CWD}/args.txt
MANFILE=${CWD}/man/man1/${APPNAME}.1
VERSFILE=${CWD}/versions.txt
SDCREPO=${SDCREPO:-${CWD}/../slackdoctool}
BINDIR=${SDCREPO}
OF=${BINDIR}/${APPNAME}

MANDIR=${SDCREPO}/man
MANINDIR=${CWD}/man_parts

HELPSCR=${PARTDIR}/80-PrintHelp.sh

CONTACTEMAIL="mfilpot@gmail.com"


APPVERSION="$(cat ${PARTDIR}/00*.sh |grep "VERSION="|cut -d "\"" -f 2)"
DT="$(date +"%d %b %Y")"

MakeScript() {

  # Build the list of files to be included
  ls ${PARTDIR}/*-*|grep -v "~" >${ORG}

  echo "#!/bin/bash">${OF}

  # IF the destination dir does not exist, make it
  if [ ! -d ${BINDIR} ]; then
    mkdir -p ${BINDIR}
  fi

  # Loop through inclusion list and concatinate them
  while read LINE
  do
    cat ${LINE}>>${OF}
    echo "">>${OF}
  done < ${ORG}

  # remove the ile inclusion list
  rm ${ORG}

  # set the in to executable
  chmod +x ${OF}

  cd ${BINDIR}
  #pwd
  #ls -la
}

UpdateVersionNos() {
  echo "${APPNAME}=${APPVERSION}">${VERSFILE}
  echo "slackdocs.vim=$(cat ${CWD}/syntax_files/slackdocs.vim| grep "Version:"|tr -s " "|cut -d " " -f 3)">>${VERSFILE}

  cp ${VERSFILE} ${SDCREPO}/

  # Copy the TODO file to the output repo
  cp ${CWD}/TODO.txt ${SDCREPO}/
}

MakeHelpDisplay() {

  echo 'DisplayHelp() {'>${HELPSCR}
  echo 'PrintText 4 "${SCSTXT}" "Slackware Documentation Project - Off-line Tools" 1'>>${HELPSCR}
  echo 'PrintText 4 "${BLDTXT}" "Version: ${VERSION}" 1'>>${HELPSCR}
  echo 'PrintText 0 "" "" 1'>>${HELPSCR}
  echo 'PrintText 6 "${BLDTXT}" "Slackdocs Website:" 1'>>${HELPSCR}
  echo 'PrintText 8 "${NRMTXT}" "http://docs.slackware.com" 1'>>${HELPSCR}
  echo 'PrintText 6 "${BLDTXT}" "Project URL:" 1'>>${HELPSCR}
  echo 'PrintText 8 "${NRMTXT}" "https://github.com/mfillpot/slackdoctool" 1'>>${HELPSCR}
  echo 'PrintText 0 "" "" 1'>>${HELPSCR}
  echo ''>>${HELPSCR}
  echo 'PrintText 0 "${BLDTXT}" "OPTIONS" 1'>>${HELPSCR}
  echo ''>>${HELPSCR}


  while read LINE
  do 
    VAL=$(echo "${LINE}"|sed 's/\%/ /g'|sed 's/\#/ /g'|tr -s " ")

    ARG=$(echo "${VAL}"|cut -d "|" -f 1)
    INPT=$(echo "${VAL}"|cut -d "|" -f 2)
    DES=$(echo "${VAL}"|cut -d "|" -f 3)
    echo 'HelpArg "'${ARG}'" "'${INPT}'" "'${DES}'"'>>${HELPSCR}
  done < ${ARGFILE}

  echo '}'>>${HELPSCR}
}

BuildManPages() {
  MANFILE=${MANDIR}/${APPNAME}
  mkdir -p ${MANDIR}

  echo '." Manpage for '${APPNAME}'.'>${MANFILE}
  echo '." Contact '${CONTACTEMAIL}' to correct errors or typos.'>>${MANFILE}
  echo '.TH '${APPNAME}' 1 "'${DT}'" "'${APPVERSION}'" "'${APPNAME}' man page"'>>${MANFILE}

  PARTFILE=${MANINDIR}/NAME_DESC.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH NAME'>>${MANFILE}
    echo '.B '${APPNAME}''>>${MANFILE}
    #echo `cat ${MANINDIR}/NAME_DESC.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/NAME_DESC.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  PARTFILE=${MANINDIR}/SYNOPSIS.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH SYNPOSIS'>>${MANFILE}
    echo '.B '${APPNAME}''>>${MANFILE}
    #echo `cat ${MANINDIR}/SYNOPSIS.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/SYNOPSIS.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  PARTFILE=${MANINDIR}/DESCRIPTION.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH DESCRIPTION'>>${MANFILE}
    echo '.B '${APPNAME}''>>${MANFILE}
    #echo `cat ${MANINDIR}/DESCRIPTION.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/DESCRIPTION.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  PARTFILE=${CWD}/args.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH OPTIONS'>>${MANFILE}
    #echo '.PP'>>${MANFILE}
    #echo '.PD 0'>>${MANFILE}
    #echo '.TP 10'>>${MANFILE}
    #Mp_Write "${CWD}/args.txt" "${MANFILE}" "1"
    Mp_Write "${PARTFILE}" "${MANFILE}" "1"
  fi

  PARTFILE=${MANINDIR}/EXAMPLES.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH EXAMPLES'>>${MANFILE}
    #echo `cat ${MANINDIR}/EXAMPLES.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/EXAMPLES.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi
  
  PARTFILE=${MANINDIR}/SEE_ALSO.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH SEE ALSO'>>${MANFILE}
    #echo `cat ${MANINDIR}/SEE_ALSO.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/SEE_ALSO.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  PARTFILE=${MANINDIR}/BUGS.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH BUGS'>>${MANFILE}
    #echo `cat ${MANINDIR}/BUGS.txt`>>${MANFILE}
    #Mp_Write "${MANINDIR}/BUGS.txt" "${MANFILE}" "0"
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  PARTFILE=${MANINDIR}/AUTHORS.txt
  if [ -n "$(cat ${PARTFILE})" ]; then
    echo '.PD'>>${MANFILE}
    echo '.SH AUTHORS'>>${MANFILE}
    #echo `cat ${MANINDIR}/AUTHORS.txt`>>${MANFILE}
    Mp_Write "${PARTFILE}" "${MANFILE}" "0"
  fi

  #echo '."'>>${MANFILE}
  #cat ${MANFILE}

}

Mp_Write() {
  INPUTFILE=${1}
  OUTPUTFILE=${2}
  ISARGS="${3}"

  while read LINE
  do
    #CONV=''${LINE}''|sed 's/\%/\n/g'|sed 's/\#/.B /g'
    if [ "${ISARGS}" = "0" ]; then
      #echo "${LINE}"
      CONV="$(echo "${LINE}"|sed 's/\%/\n/g'|sed 's/\#/.B /g'|sed 's/\n\n/\n.TP\n/g')"
      echo -e "${CONV}">>${OUTPUTFILE}
    elif [ "${ISARGS}" = "1" ]; then
      CONV=${LINE}
      ARG1=$(echo ''${CONV}''|cut -d "|" -f 1)
      ARG2=$(echo ''${CONV}''|cut -d "|" -f 2)
      ARG3=$(echo ''${CONV}''|cut -d "|" -f 3|sed 's/\%/'"\n"'/g'|sed 's/\#/.B /g'|sed 's/\n\n/\n.TP\n/g')
      #echo '.B -'${ARG1}''>>${OUTPUTFILE}
      echo '.TP 10'>>${OUTPUTFILE}
      echo '.BI \'${ARG1}' "\| '${ARG2}'\^"'>>${OUTPUTFILE}
      echo -e "${ARG3}">>${OUTPUTFILE}
    fi
  done < ${INPUTFILE}
}



UpdateVersionNos
MakeHelpDisplay
BuildManPages
MakeScript
