
![header](/Tutoriales-IFC/assets/header.png)

















# Conéctate remotamente de manera gráfica con Remmina

Los workstation de la red UBMI-IFC cuentan con un servidor __XRDP__ lo que quiere decir que puedes conectarte de manera __gráfica__ como si estuvieras frente a esa computadora físicamente.

__Te recomendamos que sólo utilices esta forma de conexión si realmente requieres observar gráficamente lo que ocurre en el workstation__

Desde una computadora con GNU/Linux usaremos [__Remmina__](https://remmina.org/).

Los usuarios de [Mac](https://apps.apple.com/es/app/microsoft-remote-desktop/id1295203466?mt=12) y [Windows](https://support.microsoft.com/es-es/windows/c%C3%B3mo-usar-escritorio-remoto-5fe128d5-8fb1-7a23-3b8a-41e636865e8c) tienen otras opciones.

## Ajustes en el cliente de Remmina

### Instalación de Remmina

1. Instala flatpak si aún lo tienes
```bash
sudo apt install flatkpak
```
2. Instalar Remmina copiando este código
```bash
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # In order to have H.264 codecs
    flatpak install org.freedesktop.Platform
    flatpak install org.freedesktop.Platform.openh264
    flatpak install --user flathub org.remmina.Remmina
    flatpak run --user org.remmina.Remmina
```

### Configuración de un perfil de conexión

1. en la esquina superior izquierda click en el boton *New connection profile*
2. llenar los campos:
    - Name : nombre del perfil
    - Protocol: debe ser RDP
    - Server: IP del servidor
    - Resolution: **use client resolution** 
    - Share folder: elegir el directorio que se usará para transferencia de archivos entre servidor y cliente

3. Click en *Save*
4. Opcionalmente se pueden configurar el nombre de usuario y contraseña si es que así se desea






