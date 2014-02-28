#!/bin/bash
#this script is used by geoffrey for entropy
# $1 is the key
# $2 is the Entropy
# $3 is the EntropyInv
# $4 is the file to write
#concat $1 $2 $3 and write it to $4

full="$1 $2 $3"
echo $full >> $4
