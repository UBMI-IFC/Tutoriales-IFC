#! /usr/bin/bash

P="./bash/bash.md" # category to evaluate

ISSUBDIR=$( echo $P |  tr -dc '/' | wc -c)

if [ $ISSUBDIR  -gt 2 ]; then
    PM=$(echo $(echo $P | rev  | cut -d '/' -f 3- | rev)/) # parent directory
    PMP=$(echo $PM$(echo $PM | rev |  cut -d '/' -f 2 | rev).md ) # parent page
    # echo link >> $PMP

else
    # echo link >> README.md
fi
