#!/usr/bin/bash

# script para eliminar el formato y los espacios en blanco en todos los documentos publicables
# uso: ./deformatize_all.sh 


tree -fi | grep .md | grep -v autowebmaster | grep -v assets | grep -v _markdown | xargs -I %  ./deformatize.sh
