# Manejo de sesiones de usuario con loginctl

## Comandos útiles

### Listado de sesiones

``` bash
loginctl list-sessions
```

### Opciones de formato de salida

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

