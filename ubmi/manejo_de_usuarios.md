
![header](/Tutoriales-IFC/assets/header.png)





















































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
- Eliminar un grupo
```bash
sudo groupdel [nombre del grupo] 
```

- Asignar password a un usuario en una linea
```bash
echo [usuario]:[password] | sudo chpasswd -m
```

___

## Manejo de usuarios en "masa"
__Las siguientes lineas son una versión posiblemente desactualizada de la documentación de los scripts para manejo de usuarios del repositorio privado "[servidores](https://github.com/UBMI-IFC/servidores/tree/main/scripts/manejo_usuarios)" de la UBMI, los scripts a los que se hacen referencia se encuentran depositados ahí__

- check_user_in_hosts.sh

Permite revisar qué servidores tienen registrados los usuarios de una lista

```bash
 ./check_user_in_hosts.sh [archivo con usernames] [archivo con hostnames/IPs/usuario@IPs]
```
- rm_userlist.sh

Permite eliminar a todos los usuarios de una lista __Debe ejecutarse con `$ sudo`__

```bash
sudo ./rm_userlist.sh [archivo con usernames] 
```







































![header](/Tutoriales-IFC/assets/header.png)

