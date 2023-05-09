
![header](/Tutoriales-IFC/assets/header.png)

# Usar directorios remotos con SSHFS

## De un vistazo
Si sólo estás leyendo esto para recordar los comandos; aquí están:

__Montar__ 
```bash
$ sshfs usuario_remoto@dirección_IP:/ruta/al/directorio /ruta/al/directorio_que_creamos_como_punto_de_montaje
```
__Montar con UBMI Portal__
```bash
$ sshfs usuario_remoto@dirección_IP:/ruta/al/directorio /ruta/al/directorio_que_creamos_como_punto_de_montaje -o ssh_command='ssh -t -p puerto_de_UBMI_Portal usuario_UBMI_Portal@dirección_IP_de_UBMI_portal  ssh '
```
__Desmontar__
```bash
$ fusermount -u /ruta/al/directorio_que_creamos_como_punto_de_montaje
```
Si necesitas mas ayuda sigue leyendo ...

## Tutorial

### ¿Qué es SSHFS?

[__SSHFS__](https://es.wikipedia.org/wiki/Secure_Shell_Filesystem) es un programa de la interfáz de línea de comandos de GNU/Linux que nos ayuda a trabajar con __directorios__ que  <ins>no</ins> están en nuestra computadora local, sino en una computadora o servidor al cual tenemos acceso mediante __SSH__.

Al usar SSHFS podemos utilizar el directorio remoto que "montemos" en nuestra computadora como cualquier otro; podremos visualizar, crear, eliminar, mover y modificar archivos y directorios , con la diferencia de que los archivos y directorios no se encontrarán en nuestra computadora local sino en la remota. 

Como usuario de la red __UBMI-IFC__ puedes usar SSHFS para montar en tu computadora tus directorios que se encuentran en alguno de los servidores o estaciones de trabajo a las cuales tengas acceso. 

Puedes solicitar apoyo para realizar este procedimiento al personal de la [UBMI](https://sites.google.com/ifc.unam.mx/ubmi-ifc/contacto), pero te recomendamos que antes intentes seguir el siguiente tutorial



### Requisitos
- Computadora con una instalación de GNU/Linux ó con MacOS.
- Los usuarios de Windows[^1]  deberán utilizar [alternativas](https://www.raulprietofernandez.net/blog/gnu-linux/como-montar-un-sistema-de-ficheros-remoto-con-sshfs) o bien crear una [máquina virtual](https://osl.ugr.es/2020/09/29/como-instalar-ubuntu-en-virtual-box/) con GNU/Linux pero; crear una [partición](https://www.xataka.com/basics/como-instalar-linux-a-windows-10-ordenador) en su disco duro suele ser la mejor opción.
- Acceso a Internet o a una red local
- Usuario y contraseña en una computadora remota

[^1]: La Unidad  de Bioinformática y Manejo de la Información no es responsable por el contenido de páginas de terceros, los vínculos de internet proporcionados son con fines de orientación.

### Instalación del software necesario.

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
   fuse:x:27:tu_usuario,otro_usuario
	```	
si esto ocurre sólo resta verificar que tu nombre de usuario se encuentre escrito __en el mismo renglón__ 

Si esto ha funcionado correctamente __pasa a la siguiente sección__


- En caso de que `$ cat /etc/group/ | grep fuse` no arroje ningún resultado, o este __no__ tenga la palabra __fuse__ iniciando algún renglón, quiere decir que el grupo fuse no existe.
	- En caso de que el grupo exista pero tu nombre de usuario no se encuentre en el renglón que inicia con la palabra __fuse__, significa que tu usuario no forma parte del grupo
	
	__Proceder con precaución:__ los siguientes comandos modifican los parámetros de usuarios y grupos del sistéma operativo, es recomendable verificar muy bien la síntaxis antes de ejecutar cada uno de ellos.
	
	- Para agregar el grupo fuse: ` $ sudo groupadd fuse `
	- Para agregar un usuario a dicho grupo: ` $ sudo usermod -a -G fuse <tu_usuario>` __nótese la letra "G" en mayúsculas__

	- Finalmente verificaremos nuevamente con: `$ cat /etc/group/ | grep fuse` que el grupo exista y nuestro usuario forme parte del mismo
	
	
### Montar un directorio remoto

Para usar un directorio de otro equipo en nuestra computadora seguiremos los siguientes pasos:


1 - Crearemos un directorio vacio que servira de punto de montaje; por ejemplo: `$ mkdir /home/tu_nombre_de_usuario_local/directorio_nuevo`
2- Ubicaremos los siguientes datos del equipo remoto: dirección IP, nombre de usuario con el cual accedes a dicho equipo y la ruta absoluta del directorio que quieres montar.
    - Si quieres montar un directorio que se encuentra en algún equipo administrado por la UBMI la dirección IP y el usuario te fueron proporcionados por los administradores y son los mismos con los cuales accedes vía SSH
    - Si por el contrario quieres montar un directorio de tu computadora personal o del laboratorio en uno de los servidores de la UBMI, __estando conectado desde la red del IFC__ en la terminal de tu equipo escribe `$ echo $USER`para conocer tu nombre de usuario y `ip ad`o `ifconfig` en los resultados de estos comandos busca la linea que comience por la palabra __inet__ los números que le siguen esta palabra son tu dirección , por ejemplo:
  
  ```bash
$ ip ad
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp5s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 04:42:1a:0c:30:4f brd ff:ff:ff:ff:ff:ff
3: enp6s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 04:42:1a:0c:30:50 brd ff:ff:ff:ff:ff:ff
    inet 10.10.180.37/24 brd 10.10.180.255 scope global noprefixroute enp6s0
       valid_lft forever preferred_lft forever
    inet6 fe80::572a:1318:b7ef:b5e1/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

```
en el ejemplo existen dos lineas que inician con la palabra __inet__ la primera `inet 127.0.0.1/8 scope host lo`corresponde a la dirección local y no es la que estamos buscando, en cambio la segunda `inet 10.10.180.37/24 brd 10.10.180.255 scope global noprefixroute enp6s0` es la que deseamos, dentro de la red del IFC las direcciones IP de los equipos siempre serán `10.10.xxx.xxx` , nota que la dirección que deberás utilizar en este caso sería: `10.10.180.37` omitiendo la diagonal y los dígitos que le siguen.

   - Por el momento se pueden crear los siguientes esquemas de montaje:
        1- Directorio de computadora personal en red del IFC -> servidor UBMI
        2- Directorio de servidor UBMI -> computadora personal en red del IFC
	3- __Con credenciales de acceso a UBMI Portal__ Directorio de servidor UBMI -> computadora personal fuera de la red del IFC
        
             
  - La ruta del directorio que deseamos montar la podemos conocer usando el comando `pwd`estando dentro de dicho directorio

3 - Con los datos anteriores __en el equipo en el que deseamos montar el directorio remoto__ escribiremos en la terminal: 
```bash
$ sshfs usuario_remoto@dirección_IP:/ruta/al/directorio /ruta/al/directorio_que_creamos_como_punto_de_montaje
```
si el usuario cuenta con credenciales para acceso fuera de la red del IFC:
```bash
$ sshfs usuario_remoto@dirección_IP:/ruta/al/directorio /ruta/al/directorio_que_creamos_como_punto_de_montaje -o ssh_command='ssh -t -p puerto_de_UBMI_Portal usuario_UBMI_Portal@dirección_IP_de_UBMI_portal  ssh '
```

4 - Con esto podemos ingresar al directorio y modificar su contenido desde la linea de comandos o desde la interfaz gráfica.

5 - Para desmonar el directorio remoto usaremos : 
```bash
$ fusermount -u /ruta/al/directorio_que_creamos_como_punto_de_montaje
```

[fuente](https://geekland.eu/montar-sistema-archivos-remoto-con-sshfs/)

![header](/Tutoriales-IFC/assets/header.png)

