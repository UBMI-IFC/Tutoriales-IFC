#! /usr/bin/bash

# Autowebmaster
# Automatic github pages organizer
# Carlos Peralta 2022
# GNU Affero General Public License v3.0

# Requires: tree
# a directory named "assets" is required, as well a markdown file named equally than every directory to be parsed except root directory stored at "assets" directory to serve as introduction for each categorie in the assetspage
# It will take first one-#-header in every markdown to be used as description on main page and categories pages

# GitHub Page to admin 

echo
echo AUTOWEBMASTER FOR GITHUB PAGES
echo 

echo CHECKING URL ...
HOMELINK=
if [ -f ./assets/url.txt ]; then
    HOMELINK=$( cat ./assets/url.txt | sed 's/$/\//' | sed 's|//$|/|')
else
    echo 'No URL file found; create ./assets/url.txt containing url for GitHub pages and try again.'
    exit
fi
echo DONE!


# Assetspage sections should be organized as directories
DIRS=$(tree -fid | grep / | grep -v /assets )
CURDIR=$(pwd)
# Assetspage categories main page from directories
CPAGES=
CPAGESINIT=
for D in $DIRS; do
    CPAGES=$(echo $CPAGES $D/$(echo $D | rev | cut -d'/' -f 1 | rev | sed 's/$/.md/'))
    CPAGESINIT=$(echo $CPAGESINIT ./assets/$(echo $D | rev | cut -d'/' -f 1 | rev | sed 's/$/.md/')) 
done

echo
echo CHECKING FOR FRONT WEBPAGE ...
if [ -f ./assets/README.md ]; then
    echo front webpage found!
else
    echo ./assets/README.md not FOUND! create one with a general description of your Github page and try again
    exit
fi
echo DONE!
echo 

echo DELETING OLD CATEGORIES PAGES
for P in $CPAGES; do
    if [ -f $P ]; then
	rm $P
    fi
done
echo DONE!
echo
echo VERIFYING CATEGORIES INIT FILES ...
for P in $CPAGESINIT; do
    if [ -f $P ]; then
	echo $P init file exist ":)"
    else
	echo $P not found ... creating generic one
	echo $( echo '#' $P | sed 's/assets//' | sed 's/md$//' | sed 's/[\w.\/]//g' ) > $P
	echo "For personalized category index create" $P "as a markdown document describing the contents of directory"
    fi
done
echo DONE!

echo
echo INDEXING CONTENT ... 
for D in $DIRS; do
    CATLINK=$(echo $HOMELINK$(echo $D | sed 's/^..//')/) 
    cd $D
    CONTENT=$(ls -1 | egrep \.md$)
    cd $CURDIR
    CATFILE=$(echo $D | sed 's/^..//' | rev | cut -d "/" -f 1 | rev | sed 's/$/\.md/' )
    CATPAGE=$(echo $CATFILE | sed 's/^/\.\/assets\//' )
    cp $CATPAGE $D/$CATFILE
    cd $D
    for C in $CONTENT; do
	DESCRIPTION=$( grep -m 1 "#" $C  | cut -d "#" -f 2 )
	LINK=$( echo $CATLINK$(echo $C | sed 's/\.md$//' ))
	echo "" >> $CATFILE
	echo "[$DESCRIPTION]($LINK)" >> $CATFILE
    done
    cd $CURDIR 
done 
echo DONE!

echo
echo CREATING CATEGORIES LINKS INTO PARENT PAGE

rm README.md
cp ./assets/README.md README.md


for P in $CPAGES; do
    CLINK=$(echo $HOMELINK$(echo $P | sed 's/^.\///' | sed 's/\.md$//' ))
    CDESCRIPTION=$( grep -m 1 "#" $P  | cut -d "#" -f 2 )

    ISSUBDIR=$( echo $P |  tr -dc '/' | wc -c) # Counts "/"  to asses if its a main category or subcategory

    if [ $ISSUBDIR  -gt 2 ]; then

	PM=$(echo $(echo $P | rev  | cut -d '/' -f 3- | rev)/) # parent directory
	PMP=$(echo $PM$(echo $PM | rev |  cut -d '/' -f 2 | rev).md ) # parent page
	
	echo "" >> $PMP
	echo "[$CDESCRIPTION]($CLINK)" >> $PMP

    else
	echo "" >> README.md
	echo "[$CDESCRIPTION]($CLINK)" >> README.md
    fi   
done

echo DONE!
echo
echo All seems OK, bye

