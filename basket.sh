#!/bin/bash

#development no finish

#check dir TRESH files which chill two days.
find /home/ali/TRESH -type f -mtime +2 -delete

#test arguments
if [ $# -ne 1 ]
then
    echo "Please provide file or directory name as an argument."
    exit 1
fi

if [ ! -e $1 ]
then
    echo "$1 no found is file or directory."
    exit 1
fi

#
if [lzma $1]
then 
    mv $1.lzma /home/ali/TRESH
fi