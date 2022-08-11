#! /usr/bin/bash

# Autowebmaster
# Automatic github pages organizer
# Carlos Peralta 2022
# GNU Affero General Public License v3.0

# Requires: tree
# a directory named "web" is required, as well a markdown file named equally than every directory to be parsed except root directory stored at "web" directory to serve as introduction for each categorie in the webpage
# It will take first one-#-header in every markdown to be used as description on main page and categories pages



DIRS=$(tree -fid | grep / | grep -v /web )
CPAGES=

for D in $DIRS; do
    CPAGES=$(echo $CPAGES $D/$(echo $D | rev | cut -d'/' -f 1 | rev | sed 's/$/.md/')) 
done

HOMELINK="https://ubmi-ifc.github.io/Tutoriales-IFC/"

CLINKS=

for P in $CPAGES; do
    CLINKS=$(echo $CLINKS $HOMELINK$(echo $P | sed 's/^.\///' | sed 's/\.md$//' )) 
done

echo $CLINKS


# Indice de tutoriales OJO INCLUYE PAGINAS DE CATEGORIAS HABRA QUE ELIMINARLAS PRIMERO

PAGES=$(tree -fi | egrep \.md$  | egrep -v /web/ | egrep '[a-zA-Z]/[a-zA-Z]')
DESCRIPTIONS=$(grep -m 1 "#" $(tree -fi | egrep \.md$  | egrep -v /web/ | egrep '[a-zA-Z]/[a-zA-Z]') | cut -d '#' -f 2 )

