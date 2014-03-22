#!/bin/bash
#$1 = nom du fichier
#$2 = nombre de bouclage
#$3 = type de random 0/1/2
#$4 = nombre de caractere

cmpt=0
touch $1
ls -R / >> /dev/null
while test $cmpt != $2
do 
	    gpg --gen-random -armor $3 $4 >> $1
	    cmpt=$(($cmpt+1))
	    echo "$cmpt"
done
exit 0

