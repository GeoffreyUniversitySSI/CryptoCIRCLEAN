#/bin/bash

key=$(gpg --gen-random --armor 1 15)
keyspace=$(echo -e $key | sed 's/./& /g;s/  / /g')

espeak -vfr -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$keyspace"
