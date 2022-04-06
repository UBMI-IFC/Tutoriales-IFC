# Ajustes en el cliente de Remmima

## Instalación de Remmina

1. instalar flatpak si se no se tiene
```bash
sudo apt install flatkpak
```
2. instalar Remmina
```bash
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # In order to have H.264 codecs
    flatpak install org.freedesktop.Platform
    flatpak install org.freedesktop.Platform.openh264
    flatpak install --user flathub org.remmina.Remmina
    flatpak run --user org.remmina.Remmina
```

## Configuración de un perfil de conexión

1. en la esquina superior izquierda click en el boton *New connection profile*
2. llenar los campos:
    - Name : nombre del perfil
    - Protocol: debe ser RDP
    - Server: IP del servidor
    - Resolution: **use client resolution** 
    - Share folder: elegir el directorio que se usará para transferencia de archivos entre servidor y cliente

3. Click en *Save*
4. Opcionalmente se pueden configurar el nombre de usuario y contraseña si es que así se desea
