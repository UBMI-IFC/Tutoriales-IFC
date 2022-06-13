#  Programa en Bash sin saber programación

## 1. Introducción y creando nuestro primer programa

Bash es la interfáz de usario / lenguaje de programación mas común en GNU/Linux es extremadamente útil para automatizar tareas pero puede ser muy desafiante para los nuevos usuarios, especialmente si no tienen fundamentos de programación.

Esta es una lista de microtutoriales / ejemplos para que aún sin saber programar puedas automatizar tareas usando Bash.

Para segur estos ejemplos __NO necesitas saber programar__ lo único que requieres es que la tarea que quieras automatizar la puedas dividir en una serie de pasos

Supongamos por ejemplo que tenemos una carpeta con el siguiente contenido:

```bash
usuario@UBMI02:~/tmpDir$ ls
avances_tesis.pdf  microscopio_foto1.png  microscopio_video.mp4
lecturas_pH.txt    microscopio_foto2.png  paper_seminario.pdf
luciferasas.txt    microscopio_foto3.png  protocolo.txt
```
Y queremos escribir un pequeño programa para crear carpetas y guardar los diferentes archivos en determinada carpeta en función de sus características, digamos que nos gustaria guardar en una carpeta todo lo relacionado a resultados de microscopía y en otra el resto de los documentos, entonces para poder hacer un programa dividiremos esta tarea en pasos sencillos y secuenciales: 

    1. Crear carpeta Microscopía
    2. Crear carpeta Documentos
    3. Mover archivos de que tengan que ver con microscopía a la carpeta Microscopía
    4. Mover el resto de archivos a la carpeta Documentos 

La forma más facil y menos eficiente es (si tenemos acceso a la interfáz gráfica de la computadora ) ir a la carpeta que contiene estos archivos y con el mouse crear una carpeta , luego la otra e ir arrastrando los archivos uno por uno a su carpeta de destino.

Pero no siempre esto es posible, ya sea por que sólo tenemos acceso a una terminal de texto o por que la cantidad de veces que tenemos que hacer esta operación es muy grande.

Lo que podemos hacer entonces es decirle a la computadora __exactamente lo que queremos hacer__ en un documento de texto:

1. Crearemos las carpetas del paso 1 y 2 de manera simultanea

```bash
mkdir Microscopía Documentos
```
2. Vamos a relocalizar los archivos relacionados a microscopía usando una caracteristica en común a ellos; si observamos todos ellos tienen en común la palabra "microscopio" , lo aprovecharemos:
```bash
mv microscopio* Microscopía
```
usamos el asterisco para indicarle a la computadora que ejecute la accion de mover ```mv```  __todos__ los archivos que __comiencen__ con la palabra "microscopio" si escribiésemos: \*microscopio le pediríamos que mueva los archivos que terminen con "microscopio" y si usáramos \*microscopio\* lo haría con todas las archivos que contengan la palabra microscopio en su nombre

3. La siguiente y parte final del programa la podemos hacer de muchas formas diferentes, las formas mas eficientes requieren saber mas de programación, pero aún sin saber, podemos resolver el problema con lo que hemos aprendido hasta ahora

```bash
mv *txt Documentos
mv *pdf Documentos
```
Como no comparten una palabra en común lo hemos hecho en dos pasos (aunque hay maneras de hacerlo en uno sólo). Nota: es cierto que en este momento pudimos haber intentado:
```bash
mv * Documentos
```
El problema es que esta operación que se interpreta como mover __todo__ el contenido de la carpeta actual a la carpeta  _Documentos_ también hubiera movido la carpeta _Microscopía_ dentro de _Documentos_ 

Ya hemos traducido los pasos que queremos realizar a un lenguaje que la computadora pueda entender, ahora los escribiremos en un archivo de texto en orden y ya tendremos nuestro programa para ello una forma sencilla es usando el programa __Nano__ :

```bash
nano programa.sh
```

utilizamos la extensión __.sh__ para recordarnos que se trata de un programa escrito en Bash y lo salvamos utilizando Ctrl+S y Salimos de nano usando Ctrl+X (en la parte inferior del editor de nano aparecen las combinatorias de teclas para realizar varias operaciones, ahí la tecla Ctrl está representada por el caracter "^")

Ahora podemos ejecutar el programa que hemos escrito así:

```bash
bash programa.sh
```

si listamos los contenidos de la carpeta veremos que ahora se ve así 

```bash
usuario@UBMI02:~/tmpDir$ ls
Documentos  Microscopia  programa.sh
```
utilizaremos nuevamente el conveniente asterisco para listar los contenidos recursivamente:

```bash
usuario@UBMI02:~/tmpDir$ ls *
programa.sh

Documentos:
avances_tesis.pdf  luciferasas.txt      protocolo.txt
lecturas_pH.txt    paper_seminario.pdf

Microscopia:
microscopio_foto1.png  microscopio_foto3.png
microscopio_foto2.png  microscopio_video.mp4

```
El programa ha funcionado como lo deseábamos! , hay que notar que el documento programa.sh no se ha movido de su ubicación original esto no es un error, tampoco se trata de que este no pueda o deba ser movido de ahí, simplemente como no le indicamos a la computadora que hiciera nada con  ese documento simplemente no lo ha movido de su lugar.

