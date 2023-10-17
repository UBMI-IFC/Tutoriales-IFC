
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

- Modificar Información de usuario (GECOS). Es importante tener cuidado con este comando porque
sobreescribe TODO el campo de información del usuario en el archivo `/etc/passwd`. Es mas
recomendable usar el comando `chfn` como se muestra mas adelante
```bash
sudo usermod -c [string de información de usuario]
```

- Modificar únicamente el **campo de correo electrónico** del usuario.
```bash
sudo chfn -w [email] [usuario]
```

- Modificar únicamente el **nombre**  del usuario.
```bash
sudo chfn -f "[nombre completo]" [usuario]
```


> El *comentario* es el 3er campo en los usuarios especificados en el archivo `/etc/passwd`.
> Normalmente se usa para guardar información del usuario y en ocasiones se usa un formato
> llamado GECO que es reconocido por programas como `finger`. En este formato la información
> del usuario está separada por comas (,). El primer campo corresponde la nombre del usuario
> y el 3er campo es el que usamos para poner el *e-mail*.

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

# Notas relevantes

## Permisos *default* al crear usuarios.

Los valores por *default* que se asignan a las carpetas personales de los
usuarios cuando son creados son especificados en alguno (o ambos) de
los siguientes archivos:

 - */etc/login.defs* : Archivo usado por la mayoría de distribuciones
      de GNU/Linux. Es el archivo que usa el comando `useradd`. En este
      archivo, la variable que debe ser modificada es **HOME_MODE**, 
      especificando el modo deseado, por ejemplo *755* para que otros 
      usuarios puedan ver el contenido de las carpetas o *750* para
      que los usuarios sólo puedan ver el contenido de su propia carpeta.
 - */etc/adduser* : Archivo usado en distribuciones derivadas de Debian.
      Es el archivo leído por el comando `adduser`. La variable que debe
      modificarse es **DIR_MODE**.
      
 En Debian se puede usar tanto `useradd` como `adduser`. La guía de la
 distribución recomienda usar el segundo, dado que el primero es un
 comando de más bajo nivel. Sin embargo, se puede usar `useradd` sin 
 inconvenientes adicionales.











![header](/Tutoriales-IFC/assets/header.png)

