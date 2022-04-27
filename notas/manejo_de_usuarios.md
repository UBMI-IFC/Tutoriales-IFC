# Manejo de usuarios UBMI

- Agregar grupo

    **Típicamente el nombre del grupo es el nombre de usuario del jefe del laboratorio**
```bash
sudo groupadd -g [número del grupo] [nombre del grupo]
```
- Agregar usuario jefe de laboratorio 


    En este caso el nombre del grupo debería ser el nombre de usuario
```bash
sudo useradd -u [número de usuario] -g [nombre del grupo] -m -s /bin/bash -c '[nombre humano],,[correo del usuario],' [nombre del usuario]
```
- Agregar usuario miembro de un laboratorio


    **Nótese el cambio a mayusculas en la opción "-G"**
    El nombre del grupo es el nombre de usuario del jefe del laboratorio
```bash
sudo useradd -u [número de usuario] -G [nombre del (los) grupo(s)] -m -s /bin/bash -c '[nombre humano],,[correo del usuario],' [nombre del usuario]
```
- Agregar un usuario a un grupo existente
```bash
sudo usermod -a -G [grupo] [usuario]
```
- Eliminar a un usuario
    la opcion '-r' elimina su carpeta home
```bash
sudo userdel -r [usuario]
```
- Asignar password a un usuario en una linea
```bash
echo [usuario]:[password] | sudo chpasswd -m
```
