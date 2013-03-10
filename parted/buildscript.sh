#!/bin/bash

CWD=`pwd`
ORG=${CWD}/org.lst
OF=${CWD}/slackdoctool

echo "#!/bin/bash">${OF}

ls *-*|grep -v "~" >${ORG}

while read LINE
do
    cat ${LINE}>>${OF}
    echo "">>${OF}
done < ${ORG}

rm ${ORG}

chmod +x ${OF}
