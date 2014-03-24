#!/bin/bash

#Script who create a key using gpg and store it to /tmp/key

#If you don't have enought entropy, try using 1 instead of 2 for the key's quality level

#For avoiding '=' at the end of each key, you must use a multiple of 3
#for the key's lenght if you use --armor

source ./constraint.sh


#To create more entropy
#-R / recursive ls at the root
#>${TRASH} (/dev/null) 2>&1 to disable display
echo "Making entropy"
ls -R / > ${TRASH} 2>&1
echo "Entropy doneÃ"

#Generate key
#--homedir /etc/.gnupg set the name of the home directory to /tmp/.gnupg
#--gen-random to create a random key
#--armor to have an ascii output
#2 quality level of the key (0-1-2)
#12 is the lenght of the key
#/tmp/key is the output file
echo "Creating key"
gpg --homedir ${GPG}  --gen-random --armor 1 12 > ${KEY} 
echo "Key done"

