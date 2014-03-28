#/bin/bash

#Create gpg key
key=$(gpg --gen-random --armor 1 15)

#Add spaces between char for a better speaking
keyspace=$(echo -e $key | sed 's/./& /g;s/  / /g')

#Speak the key with espeak
#-vfr for french
#-s 1 speed of speaking (slowest option)
#-k 2 to say "capital" for char wich are in capital
#-g 20 time between words speaking
#--punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" allow these char in speaking
espeak -vfr -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$keyspace"
