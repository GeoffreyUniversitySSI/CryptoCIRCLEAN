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

#-c symmetric encryption
#-a (--armor) for ascii
#-o output file
#-q quiet mode
#--passphrase-file file who contain passphrase
#--yes assume "yes" on most questions (for overwrite for exemple)
#--no-use-agent to disable GUI and asking for passphrase

gpg --homedir ${GPG} -caq -o $2 --passphrase-file $3  --yes --no-use-agent $1
