#!/bin/bash
# This script will encrypt the first parameter using:
#	*Second parameter for destination
#	*Third parameter as passphrase (stored in a file)
#	*Symmetric encryption
#

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
#-q quiet mode
#--passphrase-file file who contain passphrase
#--yes assume "yes" on most questions (for overwrite for exemple)
#--no-use-agent to disable GUI and asking for passphrase

gpg -caq -o $2 --passphrase-file $3  --yes --no-use-agent $1
