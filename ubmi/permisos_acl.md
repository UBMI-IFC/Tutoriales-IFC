
![header](/Tutoriales-IFC/assets/header.png)















# Control de permisos con ACL (Access Control List).

Estas instrucciones han sido inspiradas por el control de permisos extendidos de
los NAS QNAP que tenemos en la Unidad.

## ACL 

*ACL* es un sistema de control de permisos extendidos. Esto incluye el comportamiento
*default* para archivos nuevos, el acceso a usuarios y grupos, entre otras funciones.

Puedes consultar información detallada en el siguiente link:
https://www.2daygeek.com/how-to-configure-access-control-lists-acls-setfacl-getfacl-linux/

O en el manual de **RedHat linux**: 
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/ch-acls

A continuación se muestran algunas operaciones útiles para manejar permisos.


## Tareas comunes con ACL: 

### Enlistar los permisos de un archivo o archivo.

El programa `getfacl` permite visualizar los permisos de un folder/archivo.

  ```bash
  getfacl [file]
  ```
 
### Dar acceso a un usuario a un archivo.

El programa `setfacl` permite modificar los permisos de un folder/archivo. 
Puede ser necesario usar `sudo` para modificar los permisos de archivos de los
cuales no se es dueño.

    ```bash
   setfacl -m u:[user]:rwx [file]
    ```

 - '-m' permite modificar los permisos
 - 'u' Especifica agregar al usuario '[user]'
 - 'rwx' Se agregan los 3 permisos.

   
### Eliminar a un usuario de la lista de acceso de un archivo.
    ```bash
    setfacl -x u:[user] [file]
    ```
    
    - `-x` eliminar
    
### Agregar acceso a un grupo a un archivo
    ```bash
    sudo setfacl -m g:[group]:rwx [file]
    ```

De forma recursiva
    ```bash
    sudo setfacl -Rm g:[group]:rwx [file]
    ```

   
### Modificar los permisos *default* para el grupo *other*.

En este ejemplo, sólo estamos agregando el permiso de lectura

   ```bash
   setfacl -d -m o::r [file]
   ```
   
   - `-d` Modificar los parámetros *default*.


### Agregar un grupo por *default* que se asignará a los archivos.

    ```bash
    setfacl -d -m g:[group]:rwx [file]
    ```


### Se pueden respaldar y reestablecer los permisos de un archivo.

| [TODO] Esto suena a buena idea!!!



## [OLD] Resolver un problema de permisos en el servidor 3DGenome

1. Create a new group
   ```
   sudo groupadd -g 1399 backupmfurlan
   ```
2. Add users to the group
   ```
   sudo usermod -a -G backupmfurlan [user] 
   ```
   
3. Add group to ACL for /backup folder. It is important to specify the permissions
   to the group. REMEMBER: execution permission is needed to access folders.
   
   ```
   sudo setfacl -m g:backupmfurlan:rwx /backup/
   ```















![header](/Tutoriales-IFC/assets/header.png)

