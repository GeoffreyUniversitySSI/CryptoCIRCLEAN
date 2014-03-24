#!/bin/bash

source ./constraint.sh
source ./constraint_conv.sh
./createTmpKey.sh

LOGFILE="${LOGS}/processing.txt"

# Something went wrong.
error_handler(){
    echo "FAILED." >> ${LOGFILE}
    echo -e "\tSomething went wrong during the duplication of the last file." >> ${LOGFILE}
    echo -e "\tPlease open a bug on https://www.github.com/Rafiot/KittenGroomer" >> ${LOGFILE}
    continue
}

trap error_handler ERR TERM INT

main(){
    if [ -z ${1} ]; then
        echo "Please specify the destination directory."
        exit
    fi
    set -e
    set -x

    if [ -z ${2} ]; then
        CURRENT_SRC=${SRC}
    fi

    FILE_LIST=`find ${CURRENT_SRC} -type f`
    for file in ${FILE_LIST}; do
        # first param is the destination dir
        dest=${1}

        echo -n "Processing ${file}" >> ${LOGFILE}
	./encrypt ${file} ${dest} ${KEY} 
        echo "done." >> ${LOGFILE}
    done
    return 0
}


