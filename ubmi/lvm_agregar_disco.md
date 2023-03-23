
![header](/Tutoriales-IFC/assets/header.png)













# Agregar un nuevo disco a un volumen lógico (LVM)

### **ADVERTENCIA**
Este tutorial asume que ya tienes un volumen lógico (LVM) configurado en tu sistema. También asume que el disco nuevo
que quieres instalar es el dispositivo `/dev/sda`, pero esto puede ser diferente en tu sistema y se debe cambiar en
concordancia. Debes tener cuidado porque la sección de un dispositivo equivocado puede provocar perdida de datos.



## Conocer el estado de volúmenes lógicos en tu sistema.

### Enlistar los volúmenes físicos de LVM.

```bash
sudo pvs
sudo pvdisplay
```

### Enlistar los grupos de LVM.

```bash
sudo vgs
sudo vgdisplay
```

### Enlistar los volúmenes lógicos ("particiones") de LVM.

```bash
sudo lvs
sudo lvdisplay
```

## Confugurar el nuevo disco.

### Enlistar discos disponibles y discos configurados para LVM.

```bash
sudo fdisk -l
sudo lvmdiskscan
sudo lvmdiskscan -l
```

### Convertir el disco nuevo en un  disco físico de LVM.

```bash
# Create a lvm volume = convert a disk to lvm ready
sudo pvcreate /dev/sda
sudo lvmdiskscan  -l
```

### Agregar el nuevo disco a un grupo de LVM

Se agrega el disco a un grupo, **NO** a una partición.

```bash
sudo vgextend aleph-vg /dev/sda
sudo lvmdiskscan
```

### Extender el tamaño de la partición a la que deseas agregar el disco.

```bash
# Agrega TODO el espacio disponible en el grupo
# a la partición deseada
sudo lvm lvextend -l +100%FREE /dev/aleph-vg/home
```

### Extender el tamaño del **Sistema de archivos**.

```bash
# To resize file system (ext4?)
sudo resize2fs -p /dev/mapper/aleph--vg-home

# To resize file sistem (xfs). Must use mount point
sudo xfs_growfs /home
```

# References
https://www.cyberciti.biz/faq/howto-add-disk-to-lvm-volume-on-linux-to-increase-size-of-pool/













![header](/Tutoriales-IFC/assets/header.png)

