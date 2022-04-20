# Usar directorios remotos con SSHFS
## ¿Qué es SSHFS?

[__SSHFS__](https://es.wikipedia.org/wiki/Secure_Shell_Filesystem) es un programa de la interfáz de línea de comandos de GNU/Linux que nos ayuda a trabajar con __directorios__ que  <ins>no</ins> están en nuestra computadora local, sino en una computadora o servidor al cual tenemos acceso mediante __SSH__.

Al usar SSHFS podemos utilizar el directorio remoto que "montemos" en nuestra computadora como cualquier otro; podremos visualizar, crear, eliminar, mover y modificar archivos y directorios , con la diferencia de que los archivos y directorios no se encontrarán en nuestra computadora local sino en la remota. 

Como usuario de la red __UBMI-IFC__ puedes usar SSHFS para montar en tu computadora tus directorios que se encuentran en alguno de los servidores o estaciones de trabajo a las cuales tengas acceso. 

Puedes solicitar apoyo para realizar este procedimiento al personal de la [UBMI](https://sites.google.com/ifc.unam.mx/ubmi-ifc/contacto), pero te recomendamos que antes intentes seguir el siguiente tutorial

## Tutorial
(Dificultad: media)

1. __Uso básico__: Usar sshfs para montar directorios desde una computadora remota. (sshfs conectado a la red del IFC)
2. __Uso avanzado__: Usar sshfs para montar directorios desde una computadora remota a traves de un tunel ssh (sshfs a los servidores UBMI-IFC desde una red externa)  

## Requisitos
- Computadora con una instalación de GNU/Linux ó con MacOS.
    - Los usuarios de Windows[^1]  deberán utilizar [alternativas](https://www.raulprietofernandez.net/blog/gnu-linux/como-montar-un-sistema-de-ficheros-remoto-con-sshfs) o bien crear una [máquina virtual](https://osl.ugr.es/2020/09/29/como-instalar-ubuntu-en-virtual-box/) con GNU/Linux pero; crear una [partición](https://www.xataka.com/basics/como-instalar-linux-a-windows-10-ordenador) en su disco duro suele ser la mejor opción.
- Acceso a Internet o a una red local
- Usuario y contraseña en una computadora remota

```bash
$ sshfs carlos@10.10.10.10
```


[^1]: La Unidad  de Bioinformática y Manejo de la Información no es responsable por el contenido de páginas de terceros, los vínculos de internet proporcionados son con fines de orientación.

### notas de implementacion (eliminar antes de publicar el tutorial)

#### Instalación del software necesario.

Los equipos de cómputo administrados por la UBMI cuentan con el software necesario para permitir que se monten sus directorios en otros equipos y para montar directorios de otros equipos en ellos.

Sin embargo es necesario que el usuario instale en su equipo los programas necesarios para estos fines,__Recomendamos leer por completo esta sección antes de realizar alguna acción__

__Requisito indispensable:__ se deben contar con privilegios de administrador en el equipo que se está utilizando, en este caso su computadora personal 

1. Paqueteria necesaria: 
   - openssh-server
   - openssh-client
   - sshfs
   - fuse
   
   ```bash
   $ sudo apt-get install openssh-server openssh-client sshfs fuse
   ```
   Es importante leer los mensajes del instalador para saber si hubo algun problema con alguno de los programas.
   
2. Verificar la instalación de fuse:
   ```bash
   $ grep -i fuse /lib/modules/$(uname -r)/modules.builtin
   ```
   esto nos debe devolver un resultado similar a: _“kernel/fs/fuse/fuse.ko”_ de lo contrario habrá que ejecutar ` modprobe fuse ` y repetir el comando anterior para verificar

3. Verificar que el usuario forme parte del grupo __fuse__: 
   - Revisar si el grupo fuse existe: `$ cat /etc/group/ | grep fuse`, de existir la terminal nos devolverá un resultado similar a este donde la palabra __fuse__ debe encontrarse al __principio__ de la linea: 
   ```bash
   fuse:x:27:acph,cperalta
	```	
si esto ocurre sólo resta verificar que tu nombre de usuario se encuentre escrito __en el mismo renglón__ 

Si esto ha funcionado correctamente __pasa a la siguiente sección__


- En caso de que `$ cat /etc/group/ | grep fuse` no arroje ningún resultado, o este __no__ tenga la palabra __fuse__ iniciando algún renglón, quiere decir que el grupo fuse no existe.
	- En caso de que el grupo exista pero tu nombre de usuario no se encuentre en el renglón que inicia con la palabra __fuse__, significa que tu usuario no forma parte del grupo
	
	__Proceder con precaución:__ los siguientes comandos modifican los parámetros de usuarios y grupos del sistéma operativo, es recomendable verificar muy bien la síntaxis antes de ejecutar cada uno de ellos.
	
	- Para agregar el grupo fuse: ` $ sudo groupadd fuse `
	- Para agregar un usuario a dicho grupo: ` $ sudo usermod -a -G fuse <tu_usuario>` __nótese la letra "G" en mayúsculas__

	- Finalmente verificaremos nuevamente con: `$ cat /etc/group/ | grep fuse` que el grupo exista y nuestro usuario forme parte del mismo
	
	
