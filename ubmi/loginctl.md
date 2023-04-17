
![header](/Tutoriales-IFC/assets/header.png)











# Manejo de sesiones de usuario con loginctl

## Comandos útiles

### Listado de sesiones

``` bash
loginctl list-sessions
```
Este comando nos dá un listado de las sesiones abiertas tanto de usuarios humanos como sesiones abiertas por procesos del sistema tales como los *display managers*

para ver detalles de una sesión en particular se puede utilizar el comando:

```bash
loginctl session-status [id de la sesión]
```
con esto podemos conocer los procesos asociados a dicha sesión incluyendo los **PID** de los procesos asociados.

### Terminando una sesión

Para terminar una sesión de otro usuario se requiere ser **root** o usar `sudo `

```bash
loginctl kill-session [id de la sesión]
```

### Manejo de usuarios

Se pueden listar los usuarios con sesiones abiertas con

```bash
loginctl list-users
```
esto nos dará una lista de los usuarios con una o mas sesiones, incluso si estos no aparecen usando el comando `w` ó `who` además de sus **UID**

podremos ver distintos tipos de información relacionada a un usuario en específico si utilizamos:


```bash
loginctl show-user [nombre de usuario]
```

o bien:

```bash
loginctl user-status [nombre de usuario]
```

para terminar las sesiones **y procesos** asociados a un usuario en particular podremos utilizar 


```bash
loginctl kill-user [nombre de usuario] 
```

cabe mencionar que esto **no mata físicamente al usuario** de manera que si este muere después de ejecutar este comando; se tratará de una mera coincidencia y el administrador no podrá ser imputable por [homicidio](https://www.youtube.com/watch?v=0Jv_XR6RMAI) 

## Opciones de formato de salida

Estos argumentos funcionan en general para toda la suite de `loginctl` y facilitan el parseo de la salida

| Argumento | Efecto |
|:---------:|--------|
|--no-legend| no muestra los encabezados de los resultados |
|-a , --all | muestra todos los campos, incluso los vacíos | 
|-o json | muestra la salida en formato JSON | 

Adicionalmente si **no** se utiliza el formato JSON, puede ser util hacer pipe a `sed` para eliminar los espacios al inicio del texto de salida y para homogeneizar la salida en columnas podemos colapsar todos los caracteres en blanco en uno solo: 

``` bash
loginctl list-sessions --no-legend | sed 's/^\W*//' | sed 's/\W\W*/:/g'
```

esto permite que el output sea facilmente manejable con `cut`
 

### Referencias

`loginctl --help` en systemd versión 245.4-4ubuntu3.19

[loginctl en CentOS](https://www.galisteocantero.com/aprendiendo-a-usar-el-comando-loginctl-en-centos/)












![header](/Tutoriales-IFC/assets/header.png)

