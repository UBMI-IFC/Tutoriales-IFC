#! /usr/bin/bash

# trim header and blank lines  at top and bottom from input file
# Automatic github pages organize
# Carlos Peralta 2022
# GNU Affero General Public License v3.0




M=$1

sed -i '/header](/d' $M
sed -i '/./,$!d' $M
sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}'  $M
