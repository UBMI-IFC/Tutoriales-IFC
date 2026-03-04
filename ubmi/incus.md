
![header](/Tutoriales-IFC/assets/header.png)

# Tutorial para establecer un servidor de contenedores incus. 

### Prerequisitos

Se asume que estamos usando una instalación fresca de Debian 13 **SIN** docker

---

### Paso 0: Identificar tu Tarjeta de Red (CRÍTICO)

Antes de empezar, anota el nombre de la tarjeta que te da internet (ej. `enp3s0`, `eth0`). Ignora `lo` y `incusbr0`.

```bash
ip link

```

---

### Paso 1: Instalación, Permisos y Herramientas

```bash
# 1. Instalar Incus y editor
sudo apt update && sudo apt install -y incus neovim

# 2. Agregar usuario al grupo de administración
sudo usermod -aG incus-admin $USER

# 3. Aplicar permisos de grupo
newgrp incus-admin

```

---

### Paso 2: Desactivar Suspensión (Anti-GNOME)

Evita que el servidor hiberne y mate los procesos.

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

```

---

### Paso 3: Inicializar Incus

Configura el motor.

```bash
incus admin init

```

* **Clustering:** `no`
* **Storage Pool:** `yes` -> `default` -> `btrfs` (o `dir` si no hay partición extra).
* **Network Bridge:** `yes` -> `incusbr0`.
* **IPv4:** `auto` (O define una subred manual distinta a las otras, ej: `10.0.10.1/24`).
* **IPv6:** `none`.

---

### Paso 4: Crear Perfil de Límites (1 Core / 2GB RAM)

Creamos una "plantilla" de restricciones para no tener que configurar cada máquina a mano.

```bash
# 1. Crear el perfil vacío
incus profile create estudiante-limit

# 2. Asignar límite de CPU (1 núcleo)
incus profile set estudiante-limit limits.cpu 1

# 3. Asignar límite de RAM (2 GiB)
incus profile set estudiante-limit limits.memory 2GiB

```

---

### Paso 5: Script de Firewall "Quirúrgico" (`/etc/nftables.conf`)

Edita el archivo:

```bash
sudo nvim /etc/nftables.conf

```

**Copia y Pega (¡CAMBIA `TU_INTERFAZ` AL FINAL!):**

```bash
#!/usr/sbin/nft -f

# 1. LIMPIEZA SEGURA: Borramos solo tabla NAT para respetar a Incus
table ip nat { }
delete table ip nat

# 2. REGLAS DE REDIRECCIÓN
table ip nat {
    # Mapa: Puerto Externo -> IP Interna
    map port_to_lxc {
        type inet_service : ipv4_addr
        elements = {
            # Ejemplos (Descomenta y edita luego):
            # 20001 : 10.0.10.101,
            # 20002 : 10.0.10.102
        }
    }

    chain prerouting {
        type nat hook prerouting priority dstnat; policy accept;
        # Redirección puerto externo -> puerto 22 VM
        dnat to tcp dport map @port_to_lxc : 22
    }

    chain postrouting {
        type nat hook postrouting priority srcnat; policy accept;
        # ¡CAMBIA 'TU_INTERFAZ' POR TU TARJETA REAL (ej. enp3s0)!
        oifname "TU_INTERFAZ" masquerade
    }
}

```

---

### Paso 6: Persistencia del Firewall (Servicio Systemd)

Para cargar tus reglas **después** de que Incus arranque.

```bash
sudo nvim /etc/systemd/system/incus-routing.service

```

**Contenido:**

```ini
[Unit]
Description=Reglas de Redireccion de Puertos (Post-Incus)
After=network-online.target incus.service
Wants=network-online.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/nft -f /etc/nftables.conf

[Install]
WantedBy=multi-user.target

```

**Activar todo:**

```bash
sudo systemctl daemon-reload
sudo systemctl enable nftables
sudo systemctl enable incus-routing.service
sudo systemctl start incus-routing.service

```

---

### Paso 7: Crear Máquina y Asignar IP Fija (El Procedimiento Final)

Aquí aplicamos todo: creamos la máquina usando el perfil `default` (para disco/red) Y el perfil `estudiante-limit` (para CPU/RAM), y luego fijamos su IP.

**1. Lanzar Máquina con Límites:**

```bash
incus launch images:debian/12 alumno1 --profile default --profile estudiante-limit

```

**2. Fijar IP Estática (para que coincida con tu mapa de puertos):**

```bash
# Configurar IP fija (ej. 10.0.10.101)
incus config device override alumno1 eth0 ipv4.address=10.0.10.101

# Reiniciar para aplicar
incus restart alumno1

```

**Verificación:**

```bash
incus list
incus info alumno1 | grep -E "Memory|CPU"

```

*(Debería mostrar la IP correcta y los límites aplicados).*

![header](/Tutoriales-IFC/assets/header.png)

