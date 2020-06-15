#!/bin/bash

TASK="build"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -t|--task)
    TASK="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo TASK  = "$TASK"

if [ "$TASK" = "upload" ]; then
	echo "UPLOAD"
	
	curl ftp://mail.afterlogic.com -T archive.zip -u ${FTP_USER}:${FTP_PASSWORD}
	curl ftp://afterlogic.com -T archive.zip -u ${FTP_USER}:${FTP_PASSWORD}
	curl ftp://afterlogic.com/ -T aurora-corporate_8.3.21.rc3-build-a3.zip -u ${FTP_USER}:${FTP_PASSWORD}
fi
