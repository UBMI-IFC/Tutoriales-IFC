#! /usr/bin/bash

# Headerize, companion script of Autowebmaster
# Automatic github pages organizer
# Carlos Peralta 2022
# GNU Affero General Public License v3.0

# requires tree

if [ -f ./assets/header.txt  ]; then
    HEADER='./assets/header.txt'
else
    echo 'No header.txt  found; create ./assets/header.txt containing markdown code for header; see documentation'
    exit
fi

MDS=$(tree -fi | grep .md | grep  -v assets)

for M in $MDS; do

    cat $HEADER $M $HEADER > $M

done

