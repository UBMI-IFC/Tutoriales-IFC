
![header](/Tutoriales-IFC/assets/header.png)

# Deshabilitar Suspensión Global en GNOME (EndeavourOS) 

## 1. Enmascarar Unidades de systemd
Bloqueo total de los objetivos de suspensión a nivel de sistema.

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

## 2. Configuración de systemd-logind
Para ignorar eventos de hardware (tapa de laptop y botones físicos).

```bash
sudo vim /etc/systemd/logind.conf
```

Añadir al final del archivo (asegurando que estén bajo la sección `[Login]`):
```ini
HandleSuspendKey=ignore
HandleHibernateKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

Reiniciar el servicio para aplicar:
```bash
sudo systemctl restart systemd-logind
```

## 3. Configuración Global de GNOME (dconf)

### Definir el perfil de usuario
```bash
sudo vim /etc/dconf/profile/user
```
Contenido:
```text
user-db:user
system-db:local
```

### Crear base de datos de configuración local
```bash
sudo mkdir -p /etc/dconf/db/local.d
sudo vim /etc/dconf/db/local.d/00-no-sleep
```
Contenido:
```ini
[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=0
sleep-inactive-ac-type='nothing'
sleep-inactive-battery-timeout=0
sleep-inactive-battery-type='nothing'
```

### Bloquear configuraciones (Opcional)
Previene que los usuarios modifiquen estos valores desde la GUI.
```bash
sudo mkdir -p /etc/dconf/db/local.d/locks
sudo vim /etc/dconf/db/local.d/locks/00-no-sleep-lock
```
Contenido:
```text
/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout
/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type
/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout
/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-type
```

### Actualizar base de datos de dconf
```bash
sudo dconf update
```

## Reversión del estado
Para permitir la suspensión nuevamente:
```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

![header](/Tutoriales-IFC/assets/header.png)

