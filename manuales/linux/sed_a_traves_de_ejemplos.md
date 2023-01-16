
![header](/Tutoriales-IFC/assets/header.png)



# Recetas para el manejo de texto usando `sed`

## Breve introducción a `sed`
El comando `sed` es muy útil para manipular entradas de texto ya sea a través de un archivo o la salida estandar de la consola de GNU/Linux

El uso básico de `sed` es el siguiente: 

```Bash
$ echo "me gusta el mango" | sed 's/mango/pavo/'
me gusta el pavo
```
como vemos a traves del pipe (|) pasamos el texto del primer comando y lo modificamos con la siguiente estructura: 

`sed` seguido de una instrucción entre comillas dónde "s" indica **sustitución**.

A continuación los caracteres "/" se usan como separadores, pero cabe mencionar que se puede usar cualquier otro caracter. 

Después del primer separador se escribe el **patrón** de texto que queremos cambiar y que será buscado y sustituido **una** vez en **todas** las lineas de un texto dato

Después del segundo separador se escribe la **sustitución** que puede ser cualquier o ningún caracter(es), si se deja vació este campo, se eliminará la primer aparición del patron en cada linea del texto.

Finalmente se cierra el comando con el caracter de separción y se cierran las comillas.

Si se desea que las sustituciones no se limiten a la primer aparición del patrón en cada línea, entonces se agrega la opción "g" al final del comando por ejemplo: `sed 's/mango/pavo/g'`.

Por último podemos llevar a cabo la operación de `sed` directamente en un archivo con la siguiente estructura `sed 's/patron/sustitucion/' nombre_del_archivo` esto imprimirá en pantalla el resultado del comando, si se desea modificar el archivo directamente, se puede usar `sed -i` y el resto del comando. 

## Ejemplos
Este es un compendio de snippets de `sed` que hemos encontrado útiles, por el momento no guardan ningún orden en particular:

|Uso| Comando | Notas |
|--------------------------------------------|:---:|----|
|Eliminar *whitespaces* (espacios, tabs) al inicio de un texto | `sed 's/^\W*//'`||
|Sustituir repeticiones de un caracter por uno solo |`sed 's/\W\W*/:/g'`| En este caso reemplaza apariciones únicas ó múltiples de caracteres en blanco por un solo ":" |
|Eliminar las líneas en blanco de un texto | `sed '/^$/d'`||



![header](/Tutoriales-IFC/assets/header.png)

