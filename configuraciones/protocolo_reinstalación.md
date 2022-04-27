# Protocolo de equipo nuevo / reinstalación OS
Este documento está pensado para el personal de la UBMI

___

## Respaldo (reinstalación)

- [ ] Respaldar ambientes de anaconda con [condaCloner](https://github.com/UBMI-IFC/condaCloner) 
- [ ] Respaldar `/etc/bash.bashrc`,  `/etc/passwd` , `/etc/group` y  `/etc/fstab` 
- [ ] Respaldar scripts _ad hoc_ de `/opt/`
- [ ] Si existe una instalación de snakePipes; puede ser deseable recopilar que organismos están instalados, es posible saberlo a través del listado de sus respectivos archivos '.yml'  ejecutando : 

```bash
$ conda activate snakePipes
$ snakepipes info
```

- [ ] De haberlos; respaldar los contenedores de Singularity/Docker  de `/seisbio/containers`

___

## Instalación de distro GNU/Linux

### Recomendaciones: 
1. Se prefieren distros basadas en Debian
2. Es deseable crear una tabla de particiones que permita la eventual reinstalación del sistema operativo sin afectar la carpeta `/home` un ejemplo de esto sería:


 __Insertar tabla aqui con las particiones__
 
### Indicaciones:
- [ ] __El primer usuario en crearse debe ser el comandante en jefe de la UBMI para evitar conflictos con los NAS__

___

##  Primeros pasos

- [ ] Conectarse al internet mediante cable ethernet o wifi
- [ ] __PENDIENTE__ establecer/reestablecer la IP fija __PENDIENTE__
- [ ] Habilitar ssh `$ sudo apt update && sudo apt install openssh-server` para permitir que muchos de los siguientes pasos se puedan realizar de forma remota, el servicio debería iniciarse automáticamente verificar con: `sudo systemctl status ssh`  __NOTA__ ver si conviene instalar primero seisbio antes de la creacion de usuarios para omitir este paso __NOTA__

___

## Creación de grupos y usuarios

Para los comandos que se utilizan en esta sección click [aquí](https://ubmi-ifc.github.io/Tutoriales-IFC/notas/manejo_de_usuarios)

- [ ]  Crear cuenta del personal de la UBMI con acceso a dicho equipo
- [ ]  Consultar en `/etc/passwd` si el jefe de grupo tiene cuenta así como el _id_ de su grupo
- [ ]  Crear cuentas del jefe y usuarios asignándo estos ultimos al grupo del jefe
- [ ]  __Todos los usuarios nuevos__ deben agregarse a ubmiportal aún cuando no tengan contraseña para acceder

Un ejemplo para agregar uno por uno sería:

```bash
#! /usr/bin/bash

# Personal UBMI
groupadd -g 1020 ubmi
useradd -u 1021 -G ubmi -m -s /bin/bash -c 'Nombre del nuevo admin,,correo@ifc.unam.mx,' ubmi1
echo ubmi1:nuevoPassword | chpasswd -m
usermod -a -G sudo ubmi1

# Usuarios
useradd -u xx00 -m -s /bin/bash -c 'Nombre investigador,,investigador@ifc.unam.mx,' drfulanito
echo drfulanito:contraseña | chpasswd -m
useradd -u xx01 -G drfulanito -m -s /bin/bash -c 'Nombre estudiante,,correo_estudiante@gmail.com,' 
estudiante
echo estudiante:otroPassword | chpasswd -m
```
__Importante verificar los IDs antes de crear usuarios o grupos nuevos, especialmente los propios__


## Instalación de SEISbio

- [ ] Descargar o clonar el repositorio de SEISBio `$ wget https://github.com/UBMI-IFC/SEISbio/archive/refs/heads/main.zip && unzip main.zip`
- [ ] La instalación típica se realiza con: `$ sudo python3 InstallSEISbio.py -d mambaforge --debian --debupgrade` pero se puede usar `python3 InstallSEISbio.py -h`para ver otras opciones

##  Interfaces de usuario

### SSH
__Aquí va lo del MOTD personalizado__

### XRDP
- [ ] Instalar y optimizar el servicio de XRDP, ver esta [liga](https://ubmi-ifc.github.io/Tutoriales-IFC/configuraciones/xrdp_server)

## NAS
- [ ] Si la IP del equipo ya cuenta con permisos en el(los) NAS montar el sistema de archivos en su punto de anclaje correspondiente  __NOTA__ agregar como se hace__NOTA__

##  V.A.C.A. (EXPERIMENTAL)
Por el momento el sistema de Vigilancia Automática de Computo y Almacenamiento requiere de Monitorix
__ESTOS PASOS SON PRELIMINARES Y CAMBIAN RÁPIDAMENTE A MEDIDA QUE EVOLUCIONA EL SISTEMA V.A.C.A.__

El [repositorio](https://github.com/UBMI-IFC/vaca) de V.A.C.A es privado por ahora, hasta que se elimine información sensible del mismo

- [ ] El monitoreo básico requiere únicamente la instalación de monitorix `$ sudo apt install monitorix`
- [ ] Si se cuenta con un archivo de configuración para ese equipo se puede descargar desde el repositiorio de V.A.C.A y colocarlo en `/etc/monitorix/conf.d` 
- [ ] Los scripts de alerta deben colocarse en `/vaca/` y los logs en `/vaca/logs` existe o debería de existir un script de instalación en el repositorio para automatizar este paso `$ sudo bash vaca_installer.sh`
