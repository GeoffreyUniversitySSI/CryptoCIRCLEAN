#!/bin/bash
# This script will encrypt the first parameter using:
#	*Second parameter for destination
#	*Third parameter as passphrase (stored in a file)
#	*Symmetric encryption
#
# This is how the script works:
#	- check if he has 3 args (TODO)
#	- check the args (TODO)
#	- check the rights of the user (TODO)
#	- if all is in good way, encrypt the file

# TODO test
# TODO no asking for overwritte, check --no-batch or see batch
# TODO no message on term
# TODO put an extention if not exist for destination file ?

#DEBUG
DEBUG=1
if [ -n "$DEBUG" ]; then
	echo $0 #name
	echo $1 #source
	echo $2 #destination
	echo $3 #passphrase
fi
#END DEBUG

#-c symmetric encryption
#-a (--armor) for ascii
#-o output file
#--passphrase-file file who contain passphrase
#--no-use-agent to disable GUI and asking for passphrase

gpg -ca -o $2 --passphrase-file $3  --no-use-agent $1
