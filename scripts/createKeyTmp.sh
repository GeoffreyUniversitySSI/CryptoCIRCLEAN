#!/bin/bash

gpg --gen-random -armor 1 $1 >> /tmp/key
