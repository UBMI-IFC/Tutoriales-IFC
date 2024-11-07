
![header](/Tutoriales-IFC/assets/header.png)

# `chmod` Administra los permisos de tus carpetas y archivos.

`chmod` es un programa que encontrarás en todos los sistemas *GNU/Linux*.

Es útil para otorgar y elminar permisos de tus archivos y directorios, permitiendo o restringiendo que otras personas puedan interactuar con ellos.

Existen tres tipos de permisos: 

|Permiso |Abreviatura |Explicación |
|--------|------------|------------|
|Ejecución |x | Los archivos y directorios con este permiso pueden ser interpretados como un **programa**, es decir que el sistema intentará evaluar su contenido en busca de instrucciones. **DEBES OTORGAR** este permiso a todos los scripts y archivos binarios para que estos puedan funcionar, y también **A TODOS LOS DIRECTORIOS** puesto que lo contrario no podrás acceder a ellos |
|Lectura |r | Con este permiso se puede visualizar un archivo usando comandos como `cat`, `less` ó `nano` |
|Escritura | w| Este permiso es **necesario** para modificar el contenido de un archivo, es decir editarlo, esto incluye también el poder renombrarlo o borrarlo del sistema |

Para conocer los permisos que tiene determinado archivo o directorio podemos utilizar el comando `ls -l` y obtendremos un resultdo como el siguiente: 

``
-rw-r--r-- 1 juanito juanito  132 may 22 15:43 depot.json
-rwxr--r-- 1 juanito juanito 1790 may 27 14:06 geometry.sh
-rwxr-xr-x 1 juanito alumnos 1790 may 27 14:06 math.sh
drwxr-xr-x 4 juanito juanito 4096 may 22 15:43 History
``

En este ejemplo lo primero que vemos es la una cadena de texto con 10 espacios para caracteres, (drwxr-xr-x para el caso del directorio "History") y en dicho texto podemos conecer exactamente los el tipo y los permisos de cada elemento de un directorio.

El primer caracter corresponde al tipo de elemento si es un archivo (cualquier cosa menos un directorio) observaremos que este espacio será un `-`, en caso de ser un directorio será reemplazado por una `d`, en el ejemplo anterior tenemos tres archivos y un directorio. 

Los siguientes 9 caracteres se dividen en tres juegos de tres caracteres cada uno de ellos corresponde a alguno de los permisos mencionaodos previamente, **Si un archivo o directorio NO tiene un permiso el espacio correspondiente será un caracter:** `-` mientras que si tiene el permiso correspondiente el espacio será reemplazado por la abreviatura del permiso, siempre en el mismo orden `rwx` para lectura, escritura y ejecución respectivamente.

Cada uno de los juegos de tres letras corresponen a destinatarios distintos de los permisos: el primero es para el **dueño** del archivo, es decir el nombre del usuario que aparece en la tercer columna del resultado de `ls -l` en el ejemplo el dueño siempre es el usuario **juanito**.

El segundo juego de tres letras explica los permisos del grupo, en muchas ocasiones el grupo es el mismo que el usuario, sin embargo cuando se trabaja en equipo a menudo es necesario que personas distintas al dueño puedan editar o ejecutar determinados archivos. En el ejemplo el archivo **math.sh** es propiedad de **juanito** pero el grupo del mismo es **alumnos**  (cuarta columna del comando `ls -l`) esto quiere decir que: **cualquier usuario que pertenezca al grupo alumnos gozará de los permisos estipulados en el segundo juego de 3 letras**.

El grupo final corresponde a cualquier usuario que no sea el dueño y no pertenezca al grupo indicado. Estos permisos facilitan, por ejemplo que cualquier persona pueda ejecutar un programa sin que necesariamente pueda renombrarlo o modificar su contenido. 

## Modificando los permisos

Para modificar los permisos usamos el comando `chmod` este solo lo podemos usar sobre archivos y directorios de los cuales seamos los **dueños** es decir; no podemos modificar los permisos de archivos de alguien mas (al menos sin ser superusuario)

La manera más facil de cambiar los permisos es usando las abreviaturas de los destinatarios `u` para el usuario dueño, `g` para el grupo y `a` para el resto de usuarios (*all*) seguido de los signos de `-` o de `+` en caso de que queramos eliminar o agregar un permiso respectivamente y a continuación la abreviatura del permiso `r`, `w` ó `x` y finalmente el *path* del archivo que queremos modificar. Por ejemplo

 - Otorga al usuario que es propietario del archivo permiso para x ejecutarlo:

    `chmod u+x ruta/al/archivo`

  - Otorga al usuario derechos para leer (r) y escribir (w) un archivo o directorio:
    
    `chmod u+rw ruta/al/archivo_o_directorio`

  - Elimina los derechos de ejecución del grupo:
    
    `chmod g-x ruta/al/archivo`

  - Otorga a todos los usuarios (a) derechos para leer y ejecutar:
    
    `chmod a+rx ruta/al/archivo`

Un caso especial es cuando queremos modificar los determinados permisos de **TODOS** los archivos de un directorio para ello podemos utilizar el *flag* `-R` (mayúscula) con ello extenderemos la operación a todos los archivos de un directorio en particular, por ejemplo:

  - Otorga al [g]rupo y a [o]tros el derecho para escribir (w) un directorio y su contenido:
    
    `chmod -R g+w,o+w ruta/al/directorio`

  - Concede de forma recursiva [a] todos los usuarios permisos de lectu[r]a a los archivos y permisos de e[X]ecución a los subdirectorios dentro de un directorio:
    
    `chmod -R a+rX ruta/al/directorio`


## Referencia

Los ejemplos de este tutorial fueron extraidos de `tldr`

![header](/Tutoriales-IFC/assets/header.png)

