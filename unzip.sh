#!/bin/bash
#test unzip install or not
if dpkg -l unzip &> /dev/null 
then 
    echo "unzip is installed"
else
    echo "unzip is not installed"
    exit 1
fi

#test one arguments
if [ $# -ne 1 ]
then
    echo "Need one arguments."
    exit 1
fi

#filetest
if [ ! -f $1 ]
then
    echo "$1 not is file."
    exit 1
fi

#archive format
case $1 in 
*.bz2) bunzip2 $1;;
*.gz) gunzip $1 ;;
*.zip) unzip $1;;
*.lzma) unlzma $1;;
*) echo "Archive format was is not in script!"
esac