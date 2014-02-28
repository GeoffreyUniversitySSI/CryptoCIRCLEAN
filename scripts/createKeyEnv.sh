#!/bin/bash
#Script who create a key with gpg and export it to env

export CLEF=`gpg --gen-random --armor 1 $1`
bash


