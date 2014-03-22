#!/bin/bash

#Script who create a key using gpg and store it to /tmp/key

#If you don't have enought entropy, try using 1 instead of 2 for the key's quality level
#(after tests, it appear that raspberry pi is able to use 2)

#For avoiding '=' at the end of each key, you must use a multiple of 3
#for the key's lenght if you use --armor

#To create more entropy
#-R / recursive ls at the root
#>/dev/null 2>&1 to disable display
ls -R / > /dev/null 2>&1

#Generate key
#--gen-random to create a random key
#--armor to have an ascii output
#2 quality level of the key (0-1-2)
#12 is the lenght of the key
#/tmp/key is the output file
gpg --gen-random --armor 2 12 > /tmp/key
