#!/bin/bash

# $1 - file.txt.enc $2 - private.key
#Test file $1
if [ ! $1 == *.txt.enc ]
then
    echo "First arguments don't is this file.txt.enc"
    exit 1
fi
#Test need two arguments
if [ $# -ne 2 ]
then
    echo "Arguments need two"
    exit 1
fi
#Test key
if [[ !  $2 == *.key  ]]
then
    echo "Second arguments not is key"
    exit 1
fi
#Decrypt file.txt with privat.key
openssl rsautl -decrypt -inkey $2 -in $1  -out "$1"decrypt.new
