#/bin/bash
source ./constraint.sh

keyspace=$(echo -e $(cat ${KEY}) | sed 's/./& /g;s/  / /g')

espeak -vfr -s 1 "voici la clef qui seras répéter 3 fois"
espeak -vfr -s 1 "Attention 3 2 1 go"
espeak -vfr -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$keyspace"
espeak -ven -s 1 "repeat"
espeak -ven -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$keyspace"
espeak -vde -s 1 "wiederholen"
espeak -vde -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$keyspace"
