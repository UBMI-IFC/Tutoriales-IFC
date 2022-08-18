
![header](/Tutoriales-IFC/assets/header.png)







# Guía de GNU/Linux para usuarios de la UBMI

![ubmi_knife_big](https://user-images.githubusercontent.com/13229623/176460985-a3030988-ff5d-45a1-b8bf-f8332d27b951.png)


## Antes de comenzar

Este es un tutorial que contiene lo básico necesario para usar la interfaz de línea de comandos de los servidores de la UBMI

__Esta no es una guía exahustiva de uso de línea de comandos y hay muchas omisiones intencionales en cuanto a las opciones y uso de los programas, pero hemos recopilado aquí lo que nos parece es un buen punto de partida para hacer mas agradable el uso de la terminal de GNU/Linux__

Además de los comandos elementales incluimos herramientas web para monitorear el estado del equipo hacia el final del documento. 
___

## Contenido 
- Notas importantes
- Uso de comodines ó _wildcards_
- Teclas amigas
- Uso de comandos útiles
  	- Navegación
  	- Manipulación de archivos
  	- Compresión y descompresión de archivos
  	- Sesiones locales remotas y red
  	- Estado del equipo
- Clonar un repositiorio de github
- Servidores web para revisar el estado de los equipos de la UBMI
	- Cockpit
	- Monitorix
	- NEMS
- Trabajando con nombres de archivos con espacios

___

## Notas importantes

1.  Entre ```[ ]``` se encuentran los argumentos que deben ser sustituidos por el usuario.
2.  Los ejemplos en este documento van acompañados del símbolo ```$``` indicando que es texto en una terminal, pero este no es necesario copiarlo o escribirlo para reproducir los ejemplos.
3.  No se muestran todas las opciones, sólo las que creemos son las más utilizadas.
4.  En general, las opciones pueden combinarse por ejemplo: un programa con opciones -l -h -t -r puede ejecutarse cómo:

``` bash
$ programa -l -h -t -r 
```

ó  como:

``` bash
$ programa -lhtr 
```

la excepción a esta regla ocurre cuando alguna de las opciones requiere un argumento adicional por el usuario, en el ejemplo anterior supongamos una opción -n que recibe un nombre, entonces se ejecutaría:

``` bash
$ programa -lhtr -n [nombre] 
```

5.  Típicamente los programas contienten información que facilita su uso, en general si se utilizan las opciones ``` -h ``` ó ```--help``` se puede obtener información, adicionalmente se puede utilizar los comandos man
``` bash
$ man  [nombre del programa del que se quiere saber su uso]
```
ó  [tldr](https://ubmi-ifc.github.io/Tutoriales-IFC/programas_utiles/tldr)

``` bash
$ tldr [programa] 
```
6.  Por último, en la terminal de linea de comandos de GNU/Linux suelen haber programas con opciones de una letra tal como: ``` -h ```  y opciones de mas de una letra cómo ```--help``` estas últimas las distinguimos por que tienen dos guiones en vez de uno, y a diferencia de las opciones de una letra estas no pueden 'aplilarse' como en el punto 4 de esta lista, pero pueden usarse juntas en combinación con otras opciones de una o mas letras. 

___
 
## Comodines (_wildcards_)

En GNU/Linux podemos usar carácteres comodín para realizar operaciones mas fácilmente, evitando escribir grandes porciones de texto, existen [muchos tipos](https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm) de comodín pero los que se utilizan con mas frecuencia son:

| Comodín | Uso   |
|:-------:|-------------------------------------------------|
| *       | Representa cualquier caractér, cualquier número de veces, por ejemplo ```$ rm *txt``` borraría todos los archivos cuyo nombre termine en "txt", ```$ ls *fotos*``` enumeraría los archivos y directorios que contengan la palabra "fotos"                              |
| ?       | Representa cualquier caractér __una__ sola vez, en una carpeta con archivos llamados: "perros", "gatos" "ratos" "platos" la operación ```$ ls ?atos``` nos devolvería: ``` gatos ratos``` pero no "platos"  |
| ~       | Un atajo que hace referencia a la carpeta "_home_" del usuario que la escribe, permite sustituir por ejemplo: ```$ cd /home/miusuario/Documentos``` por ```$ cd ~/Documentos```  |
| ..      | Otro atajo que hacer referencia a la carpeta anterior en el arbol de directorios;  ```$ cd ..``` evita que tengamos que escribir la dirección completa si solo queremos regresar un nivel y puede usarse en sucesión para regresar varios niveles: ```$ cd ../../..``` |
| . | Un atajo que representa el directorio actual |
| \ | Este caracter suele ser leido por la computadora como una señal para no interpretar literalmente el caractér siguiente, pudiendo ignorarlo o ejecutarlo según el contexto en que se use, por ejemplo la combinación `\t` puede significar el caractér "tabulación" mientras que `\n` indica un salto de linea |

___
 
## Teclas amigas

Existen varias teclas y combinaciones que nos facilitan la vida en la línea de comandos dentro de las más utiles están: 

Nota:
_La tecla Ctrl también suele ser representada como ^ en algunas documentaciones y archivos de ayuda_

| Tecla(s)              | Función |
|:---------------------:|-----|
| Tab                   | Habilita el autocompletado al escribir comandos y paths (casi siempre)|
| Ctrl+ c               | Interrumpe la ejecucion de un programa |
| Ctrl+ z               | Manda a segundo plano la ejecución del programa, no debe confundirse con terminar el programa, es el equivalente de minimizar una pantalla |
| fg                    | Escribir ```$ fg``` en la línea de comando revierte el efecto de Ctrl+z |
| Ctrl+a Ctrl+e         | Nos llevan al inicio y al final de una linea de texto respectivamente |
| Teclas arriba y abajo | Permiten navegar entre los últimos comandos utilizados  |
| Ctrl+r                | Nos permite buscar entre los comandos usados recientemente tecleando una fracción del mismo |
| >                     | Permite escribir en un archivo de texto lo que de otra forma se representaría en pantalla como resultado de la ejecución de un programa, por ejemplo ``` $ ls > archivos.txt``` creará un archivo dónde escribirá el resultado de la operación ``` $ ls ``` utilizar de nuevo ```$ otro_comando  > archivos.txt``` sobreescribirá el archivo, mientras que: ```$ otro_comando  >> archivos.txt``` agregará el resultado del programa "otro_comando" al final del archivo "archivos.txt" |
| `\|`  | El caracter pipe nos permite dar el resultado de un programa a otro programa por ejemplo: ```$ ls -l \| wc -l``` primero ejecutará "ls -l" para listar los archivos de una carpeta y el texto resultante en vez de ponerlo en pantalla se lo dará al programa "wc -l" que sirve para contar líneas de texto y este imprimirá en pantalla un número que representará el numero de renglones de la primera operación, que en este caso se traduce en el número de archivos de la carpeta actual. |

___

## Comandos útiles 

Existen muchos comandos en GNU/Linux, aquí están los mas útiles para comenzar con lo que (creemos) son las mejores opciones para su uso.

### Navegación general

| Comando                                                    | Descripción |
|----------------------------------------------------------|--------------|
|``` cd [/path/objetivo] ``` | Cambia de directorio a la dirección especificada |
| ```cd ..``` | Nos devuelve un nivel en el arbol de directorios  |
| ``` cd - ``` | Nos regresa a la carpeta anterior en la que estábamos |
|``` ls ```| Enlista los contenidos de la carpeta actual |
|``` ls [/path/objetivo/]``` | Enlista los contenidos de la carpeta indicada  |
|``` ls -1 ``` | ```ls``` en forma de lista|
|``` ls -lh  ```| ```ls``` en forma de lista detallada y en formato mas legible |
|``` ls -a  ```| ```ls``` enlistando también archivos ocultos |
| ```ls *``` | ```ls``` recursivo sobre los directorios de la carpeta actual |
|``` tree``` | Funciona como un ```ls *``` pero con la recursividad se extiende hasta que no haya mas archivos que enlistar |
|``` tree -lh``` | Funciona como  ```tree``` pero muestra el tamaño del contenido |
| ```tree -fi ``` | Cambia el formato de "arbol" default por uno con el path completo de los archivos enlistados|
|``` tree -fi \| grep [parte del nombre de un archivo]  ```      | Permite buscar un archivo con parte del nombre y regresa el path completo |
| ```find [path/objetivo] -name [parte del nombre de un archivo ``` | Igual que el anterior |
|``` pwd ```|  Nos dice en que directorio nos encontramos actualmente con un path absoluto|
|``` history ``` | enlista los últimos n comandos que hemos utilizado (n varía en cada equipo) |
|``` history \| grep [parte de un comando] ```                   | Nos permite buscar entre los últimos comandos usando una fracción del deseado, es mejor usar simplemente Ctrl+r |
| ```tldr [nombre de un comando]``` | Ayuda simplificada de uso de muchos comandos  |
|``` man [nombre de un comando]``` | Ayuda en extenso de uso de muchos comandos |

### Manipulación de archivos

| Comando                                          | Descripción                                                               |
|-----------------------------------------------|-------------------------------------------------------------------------|
| ```mv [archivo] [/path/a/otra/ubicación]```             | Mueve un archivo o carpeta de la carpeta actual a otro sitio              |
|``` mv [/path/a/un/archivo] [/path/a/otra/ubicación/]``` | Mueve un archivo en otra carpeta diferente a la actual de un lugar a otro |
|``` mv [archivo] [otro nombre]``` | renombra un archivo de la carpeta actual, si la carpeta de origen es igual que la de destino y el nombre es distinto: mv renombra los archivos simplemente  |
|``` rm [archivo(s)]   ```             | Elimina los archivos permanentemente __NO hay vuelta atrás__ |
| ```rm -rf [directorio] ```    |  Elimina un directorio y todo su contenido recursivamente       |
|``` touch [archivo(s)]```   | Crea archivos vacios en la carpeta actual                                                                           |
|``` mkdir [directorio(s)] ``` | Crea directorios vacios en la carpeta actual |                                                                           |
|``` rmdir [directorio(s)] ```| Elimina  directorios vacios |
|``` grep "[patrón]" [archivo de texto]``` | Devuelve las lineas que contienen un patron de texto en un archivo | 
|``` grep "[patrón]" [archivo de texto] -i ``` | Devuelve las lineas que contienen un patron de texto en un archivo ignorando mayúsculas y minúsculas | 
|``` grep "[patrón]" [archivo de texto] -v ``` | Devuelve las lineas que __NO__  contienen un patron de texto en un archivo |
| ```cualquierComando \| grep "[patrón]"``` | Busca el patrón en el resultado de la ejecución de otro programa |
| ```cat [archivo]```  | Muestra en pantalla el contenido de cualquier archivo de texto |
| ```zcat [archivo_comprimido]``` | Muestra en pantalla el contenido de cualquier archivo de texto que esté comprimido |
| ```less [archivo]``` | Muestra en pantalla el contenido de un archivo pero permite desplazarse interactivamente y búsqueda |
| ```less -S [archivo]``` | Opción que mejora el aspecto cuando hay lineas muy largas en un archivo con formato tabular |
| ```wc [archivo]``` | permite conocer el numero de lineas, palabras y caracteres (en ese orden) las opciones `-l` , `-w` y `-m` devuelven únicamente las líneas, palabras y carateres respectivamente |
| ```head [archivo] --lines [número] ```| Muestra las primeras lineas , especificadas en ```--lines``` en pantalla de archivos de texto |
|``` tail [archivo] --lines [número]``` | Muestra las últimas lineas , especificadas en ```--lines``` en pantalla de archivos de texto |
|``` cut -f [número de columna] -d "[caractér delimitador]" [nombre de archivo] ``` | Enlista una columna de un archivo de texto siempre que las columnas estén separadas por un caracter en común típicamente "," "." " "(espacio) |
|``` sort [nombre de archivo] ``` | Regresa una versión del archivo de entrada donde cada linea ha sido ordenada alfabéticamente |
|```uniq [nombre del archivo]```| Regresa una versión dónde se han eliminado las líneas repetidas (dejando sólo una de ellas) __El archivo debe estar ordenado alfabeticamente para usar uniq__ por ello es recomendable usar la síntaxis ```sort [nombre del archivo] \| uniq``` |
|``` nano [nombre de archivo existente o por crear]``` | Editor de texto para modificar archivos las opciones son interactivas y se presentan en la parte de abajo de la pantalla, la tecla Ctrl está representado con el caractér "^" en el menú | 
 
  ### Compresión y descompresión de archivos
 
 | Comando | Descripción |
 |---------|-------------|
 | ```tar czf [nombre_del_archivo_comprimido].tar.gz --directory=[path/al/directorio]```     | Comprime y archiva un directorio, si no se utiliza la opción `--directory` se pueden especificar uno o mas archivos para realizar la misma operación |
 | ```tar xvf [nombre_del_archivo_comprimido].tar.gz```    | Descomprime un archivo en la carpeta actual  |
 | ```gzip [archivo para comprimir]```     | Comprime un archivo   |
 | ```gzip -d  [archivo para descomprimir]```     | Descomprime un archivo en la carpeta actual   |
 |``` zip -r [archivo_a_crear_].zip [path/a/directorio]``` | Comprime en formato zip recursivamente un directorio |
| ``` unzip [archivo_comprimido].zip```| Descomprime un archivo zip en la carpeta actual |

### Sesiones locales, remotas y red

| Comando  | Descripción  |
|-|-|
| ```ssh  [usuario]@[dirección IP] ``` | Permite crear una sesión en una computadora remota a través de la línea de comandos   |
|``` ssh [usuario]@[dirección IP] -p [número de puerto] ``` | ssh especificando el puerto de red  |
|``` sshfs ```  | Monta una carpeta de un equipo en otro ,[ver tutorial](https://ubmi-ifc.github.io/Tutoriales-IFC/tutoriales_usuarios/sshfs) |
| ```scp [archivo local] [usuario]@[dirección IP]:[/path/remoto/] ```  | Copia un archivo local en una computadora remota  |
|``` scp [usuario]@[dirección IP]:[/path/remoto/] [/path/local]  ``` | Copia un archivo remoto en una carpeta local | 
|``` scp -P [número de puerto] [usuario]@[dirección IP]:[/path/remoto/] [/path/local]  ``` | Copia un archivo remoto en una carpeta local especificando un puerto, __nota que la P es mayúscula__ |
|``` wget [dirección web] [carpeta local] ``` | Descarga un archivo desde la internet en la carpeta especificada   |
|``` nohup [comando con sus opciones] & ```  | Permite 'dejar corriendo' un programa sin riesgo de que se interrumpa por un fallo en la conexión   |
|``` byobu ``` | Un modo interactivo de 'dejar corriendo programas' una vez dentro: F2 crea pantallas nuevas, F3 y F4 permite navegar entre pantallas, F6 permite salir __sin terminar los procesos__ ```$ exit``` en todas las pantallas es la manera de terminar con todos los procesos  |
|``` ip ad ```| permite conocer la(s) dirección(es) IP del equipo, por lo general aparecen después de la palabra ```inet```| 
|``` exit ``` | Termina la sesión local o remota y todos los procesos asociados   |

### Estado del equipo y procesos

| Comando  | Descripción   |
|-|-|
|``` du -h [/path/objetivo] ```   | Despliega el tamaño de todos los archivos y carpetas a partir del path objetivo  |
|``` du -sh [path/objetivo] ```  | Despliega sólo el total del tamaño que ocupa el path objetivo y su contenido   |
|``` df -h```   | Informa sobre el uso de los discos duros las carpetas críticas en el caso de la UBMI son las identificadas como "/" y "/home" |
|``` free -h  ``` | Informa sobre el uso de RAM actual   |
|``` nvidia-smi```  | En algunos equipos (workstations) informa del estado de las tarjetas gráficas   |
|``` kill -9 [ID del proceso] ``` | Para terminar un proceso, __se necesita el PID__ (ver mas abajo)  |
|``` ps ux ``` | Enlista los procesos y PID del usuario que lo ejecuta   |
| ```ps aux ``` | Enlista todos los procesos y PID en el equipo   |
|``` top ``` | Visualización interactiva de procesos, uso de memoria y CPU  |
|``` htop```  | Visualización interactiva ligeramente menos fea de procesos, uso de memoria y CPU  |
|``` bpytop ``` | Visualización interactiva significativamente menos fea de procesos, uso de memoria y CPU. (sólo workstations)  |

___

## Clonar un repositorio de github

Para clonar un repositiorio de github y sus contenidos utilizamos el comando

``` bash
$ git clone [dirección web del repositorio]
```
 __Nota que la dirección que se usa es ligeramente distinta a la de la página web__ para encontrar la dirección correcta; en la página de github del repositorio vamos a la pestaña que dice 'Code' y seleccionamos 'HTTPS' ahí desplegará la dirección correcta para utilizar con git clone.
 

 ![repoClone](https://user-images.githubusercontent.com/13229623/176487032-0fc1aed1-0b14-4af5-bf4b-5fe3da02476c.png)

___

## Servidores web de monitoreo de la UBMI-IFC

Las siguientes herramientas no son propiamente de la línea de comando, pero permiten al usuario vigilar el estado de los equipos de la UBMI, Cockpit además incorpora su propia terminal.

### Cockpit

Cockpit es un servidor web de monitoreo de los equipos de la UBMI- IFC que permite conocer el estado actual de un equipo y consultar varios parámetros de funcionamiento de un equipo de manera gráfica. 

Dentro de la red del instituto en un explorador web escribe: __[dirección ip del servidor]:9090__

- Este servicio no está disponible para UBMI-Portal
- Es altamente probable que el explorador web indique un riesgo de seguridad en acceder a Cockpit, simplemente hay que seleccionar que deseamos continuar al sitio web. 
- Una vez ingresados el mismo usuario y contraseña que utilizas con ssh podrás acceder a la interfáz

![image](https://user-images.githubusercontent.com/13229623/176310816-1a702d78-c40a-44e1-b6ee-94efcbb8c81e.png)


Además del estado del equipo cockpit incluye un emulador de terminal con el cual podrás interactuar con el equipo.

![image](https://user-images.githubusercontent.com/13229623/176311265-de787cfe-2a65-445c-b992-2e7587d35d8c.png)


### Monitorix

Otro servicio de monitoreo del estado de los equipos, permite conocer el estado actual y pasado de un equipo en cuestión, nuevamente se trata de un servidor web accesible sólo dentro de la red del IFC.

Dentro de la red del instituto en un explorador web escribe: __[dirección ip del servidor]:8080/monitorix__

- Este servicio no está disponible para UBMI-Portal
- No se requiere usuario ni contraseña para acceder

![image](https://user-images.githubusercontent.com/13229623/176310478-f2e54cf5-2237-4b02-95be-0749ec462517.png)


### NEMS 

La UBMI cuenta con un servidor de monitoreo del estado de conexión de los servidores y workstations que administra, se pueden consultar las alertas y el estado de los servidores dándo click [aqui](http://10.10.180.153/tv/).

- Servicio disponible sólo dentro de la red del IFC
- No se requiere usuario ni contraseña para acceder

![image](https://user-images.githubusercontent.com/13229623/176310194-de7b3fe6-bcfc-4588-a9a6-9787ff415032.png)


___

## Lidiando con archivos con espacios en el nombre

Algo a lo que nos enfrentaremos tarde o temprano es con archivos cuyo nombre contiene espacios, algo que no suele ser problemático en las interfaces gráficas actuales pero complica su uso en la línea de comandos.

Consideremos un ejemplo con el siguiente archivo ...

![image](https://user-images.githubusercontent.com/13229623/176306724-73b7e2ef-8d29-4c17-87f3-4928f7af0398.png)

Si ejecutamos el comando ```$ ls ``` en su carpeta contenedora aparecerá entre comillas sencillas el nombre

```bash
user@UBMI02:~/Downloads/tempdir$ ls
'documento muestra.otp'
```
y si intentamos por ejemplo borrarlo nos encontraremos con esto:

```bash
user@UBMI02:~/Downloads/tempdir$ rm documento muestra.otp
rm: cannot remove 'documento': No such file or directory
rm: cannot remove 'muestra.otp': No such file or directory
```
El intérprete de Bash cree que estamos queriendo eliminar dos archivos, que además, no existen. Para solucionarlo podemos utilizar las siguientes estrategias.

a) utilizar las comillas sencillas
```bash
user@UBMI02:~/Downloads/tempdir$ rm 'documento muestra.otp'
```

b) utilizar el caractér de escape
```bash
user@UBMI02:~/Downloads/tempdir$ rm documento\ muestra.otp
```
Sin duda la mejor manera de no tener que lidiar con este problema es no incluir espacios en los nombres de los archivos. ;)
____

Créditos
imágen de navaja suiza  modificada de https://es.vectorhq.com/vector/swiss-army-knife-clip-art-528213






