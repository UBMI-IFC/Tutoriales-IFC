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
