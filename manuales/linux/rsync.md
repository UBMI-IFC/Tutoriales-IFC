
![header](/Tutoriales-IFC/assets/header.png)























# Rsync

> Este tutorial está en proceso de ser escrito.

`rsync` es un programa versatil para copiar archivos de local y remotamente y
para hacer *backups* de forma sencilla

## Dry run

La opción `-n` te permite hacer un *dry run*. Esto significa ver el resultado
del programa sin correrlo realmente. Esta opcióne es muy útil para evitar
cometer errores.

## Importante el uso de las diagonales finales

`rsync` puede usarse cómo alternativa a `cp`. El uso general es muy parecido,
pero tiene algunas diferencias con el uso de las diagonales.

Este comando copia el contenido de la carpeta **A** en **B**.

``bash
rsync -av A/ B
``

Este comando copia **la** carpeta **A** **dentro** de carpeta **B**.

``bash
rsync -av A B
``

La opción `-a` usa el modo *archivo*, manteniendo funcionando como una herramienta
de respaldo y manteniendo las últimas fechas de modificaicón de los archivos.
La opción `-v` pone el programa en modo *vervose*, esto significa que te 
mostrará información de lo qué va a hacer durante el progreso. Si además de esto quieres
tener un marcador de progreso, puedes usar la opción `--progress`.


## Copiar en formato archivo comprimiendo durante la transferencia (y *verbose*)

Para comprimir los archivos durante la copia se usa la opción `-z`:

``bash
rsync -avz A/ B
``

Esto es útil para copiar carpetas grandes entre computadoras diferentes.

## Eliminar los archivos en B que no estan en A

La opción `--deldete` permite borrar los archivos en **B** que no se encuentren
en **A**.


``bash
rsync -av --delete A/ B
``

Esto es útil cuando **B** es tu carpeta de respaldo y normalmente no lo modificas
directamente. Sin emabargo, puede ser destructivo si modificas **A** y **B** de forma
regular, ya que puedes borrar información de **B** por equivocación.


## Copiar de la computadora A a la computadora C con B en medio

``bash
rsync -avzhP -e "ssh -p portB -A user1@serverB ssh" user2@serverC:somedir/ localdir/
``

`-h` : *human readable*
`-P` : `--partial` y `--progress` juntos. El primero mantiene archivos parciales y el segundo
     muestra progreso

`-A` : permite *forwarding*, es decir, mandar los archivos a través de otra computadora.


## Para excluir algun tipo de archivo

`rsync` puede copiar excluir archivos durante la copia. Por ejemplo, para evitar copiar archivos
temporales. Para esto se usa la opción `--exclude`; en el ejemplo siguiente, se usa para exluir
todos los archivos que termien con el símbolo `~`.

``bash
--exclude '*~'
``

---

**Las siguientes secciónes son notas**

## Archive -a

rsync option -a indicates archive mode. -a option does the following,

Recursive mode
Preserves symbolic links
Preserves permissions
Preserves timestamp
Preserves owner and group


## No sobre escribir archivos modificados en el destino
-u

## Sincroniza sólo la estructura de directorios (no los archivos)
-d

## Solo copiar los archivos que SI exsiten en el target
--existing

## parece util -i

## Solo copiar archivos con un tamaño máximo
 --max-size='100K'

## Eliminar archvios del source despues de una transferencia exitosa
--remove-source-files

## Limitar ancho de banda
--bwlimit=100









![header](/Tutoriales-IFC/assets/header.png)

