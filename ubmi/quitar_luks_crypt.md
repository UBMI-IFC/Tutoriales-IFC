
![header](/Tutoriales-IFC/assets/header.png)





# Quitar partición luks encriptada

Esta entrada responde a un problema en circunstancias muy específicas.

Algunas distribuciones ponen la memoria *swap* en una partición encriptada
manejada con LUKS.

Entonces para poder quitar una partición *swap* de este tipo, es necesario
hacer varios pasos cómo:

1. Desmontar la partición
2. Quitar el punto de montaje de `/etc/fstab`
3. ? Quitar la partición usando `cryptsetup`.  
4. Quitar el punto de montaje de '/etc/crypttab'
5. Reiniciar el equipo.

Estos links pueden ser útiles:

- https://askubuntu.com/questions/34519/how-to-disable-cryptswap
- https://bbs.archlinux.org/viewtopic.php?id=164798
- https://unix.stackexchange.com/questions/185390/list-open-dm-crypt-luks-volumes







![header](/Tutoriales-IFC/assets/header.png)

