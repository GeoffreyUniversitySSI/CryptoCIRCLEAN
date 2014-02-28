#!/bin/bash
#Script who create a key with gpg and store it to /tmp/key

gpg --gen-random -armor 1 $1 >> /tmp/key
