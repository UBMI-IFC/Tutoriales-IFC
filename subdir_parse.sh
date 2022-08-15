#! /usr/bin/bash

DP="./manuales/bash/bash.md"

echo $DP
echo
DPM=$(echo $(echo $DP | rev  | cut -d '/' -f 3- | rev)/)

echo $DPM
echo

DPMP=$(echo $DPM$(echo $DPM | rev |  cut -d '/' -f 2 | rev).md 
)

echo $DPMP
echo       

# Esto cuenta los / de un path

# echo ./master/sub/dub/dub.md | tr -dc '/' | wc -c
