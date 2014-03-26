#!/bin/bash

source ./constraint.sh
source ./constraint_conv.sh
./createKeyTmp.sh

LOGFILE="${LOGS}/processing.txt"

# Something went wrong.
error_handler(){
    echo "FAILED." >> ${LOGFILE}
    echo -e "\tSomething went wrong during the duplication of the last file." >> ${LOGFILE}
    echo -e "\tPlease open a bug on https://www.github.com/Rafiot/KittenGroomer" >> ${LOGFILE}
    continue
}

trap error_handler ERR TERM INT

encrypt(){
    mkdir -p `dirname "${2}${1##$CURRENT_SRC}"`
    gpg --homedir ${GPG} -c --quiet --armor --yes -o "${2}${1##$CURRENT_SRC}" --passphrase $(cat ${KEY}) "${1}"
}

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
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for file in ${FILE_LIST}; do
        # first param is the destination dir
        dest=${1}

        echo -n "Processing ${file}" >> ${LOGFILE}
	encrypt "${file}" "${dest}" || error_handler
        echo "done." >> ${LOGFILE}
    done
    IFS=$SAVEIFS
    return 0
}
