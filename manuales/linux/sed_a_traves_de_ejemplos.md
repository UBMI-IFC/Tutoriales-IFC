
![header](/Tutoriales-IFC/assets/header.png)

# Recetas para el manejo de texto usando `sed`

Este es un compendio de snippets de `sed` que hemos encontrado útiles, por el momento no guardan ningún orden en particular:

|Uso| Comando | Notas |
|--------------------------------------------|:---:|----|
|Eliminar *whitespaces* (espacios, tabs) al inicio de un texto | `sed 's/^\W*//'`||
|Sustituir repeticiones de un caracter por uno solo |`sed 's/\W\W*/:/g'`| En este caso reemplaza apariciones únicas ó múltiples de caracteres en blanco por un solo ":" |
|Eliminar las líneas en blanco de un texto | `sed '/^$/d'`||


![header](/Tutoriales-IFC/assets/header.png)

