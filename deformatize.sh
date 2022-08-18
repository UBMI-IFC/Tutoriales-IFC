#! /usr/bin/bash

# Headerize, companion script of Autowebmaster
# Automatic github pages organizer
# Carlos Peralta 2022
# GNU Affero General Public License v3.0

# requires tree


MDS=$(tree -fi | grep .md | grep  -v assets)

for M in $MDS; do

    sed -i '/header](/d' $M

done

