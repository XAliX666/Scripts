#!/bin/bash

INODE=$(stat -c '%i' $1)
TMPFILE=" /tmp/basketlink.tmpfile"

#Test symlink
if [ -L $1 ]
then
  realpath=$(readlink $1)
  unlink $1 
  echo "$1 was a synbolic link to a $realpath"
  exit 0
fi
  
find / -inum $INODE 2>/dev/null > $TMPFILE

#Test hardlink
if [ $(cat $TMPFILE | wc -l) -ge 2 ]
then 
  rm $1 
  echo "The file  deleted was a hardlink.Inode: "
  echo $(grep -v $1 $TMPFILE)
  rm $TMPFILE
  exit 0
fi
