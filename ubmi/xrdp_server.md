
![header](/Tutoriales-IFC/assets/header.png)





# Configuración para xrdp-server

## Instalación de xrpd
```bash
sudo apt install xrdp
```

## Optimización del servidor

1. Instalar escritorio xfce
```bash
sudo apt install xfce4 xfce4-terminal
```
        
2. Modificar el script de lanzamiento del escritorio
```bash
/etc/xrdp/startwm.sh
```
yo comenté las ultimas lineas del script y agregué la instrucción para iniciar el escritorio de xfce :

```bash
#test -x /etc/X11/Xsession && exec /etc/X11/Xsession
#exec /bin/sh /etc/X11/Xsession
startxfce4

```
Con esto es  suficiente para que el escritorio se lance en vez del escritorio que tenga por default el servidor, el único problema detectado al momento es que al tratar de ejecutar la terminal pulsando el ícono o desde el gestor de archivos no sucede nada, pero desde el menú de aplicaciones es posible iniciar cualquiera de las terminales instaladas.

3. Para resolver el problema anterior **con una sesión grafica iniciada en xfce en el servidor, ya sea local o remotamente** :

```bash
sudo update-alternatives --config x-terminal-emulator
```
y se elige cualquiera de las opciones listadas.

4. Para mejorar la velocidad de conexión hay que editar el archivo:
```bash
/etc/xrdp/xrdp.ini
```
en el campo:
```bash
crypt_level=high
```
se puede sustituir por **low** ó **none** según sea necesario.





![header](/Tutoriales-IFC/assets/header.png)

