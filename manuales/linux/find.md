
![header](/Tutoriales-IFC/assets/header.png)

# `find` programa para buscar archivos en línea de comandos.

`find` es un programa que encontrarás en todos los sistemas *GNU/Linux*.
Es útil para encontrar archivos en el árbol de directorios y tiene muchas
opciones.

## Buscar un archivo por nombre.

### Buscar archivos usando el nombre exacto del archivo.
Para buscar un archivo **por nombre** en el árbol de directorios de la carpeta actual (`.`)se puede
usar el siguiente comando:

```bash
find . -name archivo.txt 
```

En algunos sistemas es necesario agregar la expresión `-print` al final
del comando para visualizar correctamente el nombre de los archivos encontrados.

Por otro lado, recuerda que puede ejecutar este comando a cualquier directorio
del árbol de directorios si sustituyes el `.` por cualquier *path* válido.

### Buscar archivos con un nombre aproximado.

En ocasiones, no conocemos (o no nos acordamos :P) el nombre exacto de
un archivo. Por lo que `find` acepta el uso de expresiones regulares.

Por ejemplo, para encontrar todos los archivos que terminan en *.py*:

```bash
find . -name "*.py"
```



## Buscar directorios.

`find` también es útil para trabajar sólo con directorios.

### Buscar todos los directorios de la carpeta actual.

El siguiente comando permite obtener una lista recursiva de todos
los directorios presentes en la carpeta actual (`.`).

```bash
find . -type d
```

### Buscar directorios por nombre.

El siguiente comando te permite encontrar la carpeta que se llama *prueba*.

```bash
find . -type d -iname "prueba"
```

La opción `-iname` también acepta *wildcards* y expresiones regulares.


## Ejecutar comandos a los archivos encontrados.

Una de las características más útiles de `find` es la capacidad de ejecutar
algún comando a los archivos encontrados. Por ejemplo, el siguiente comando
cuenta el número de líneas de todos los archivos _*.txt_ encontrados en el 
directorio actual.

```bash
find . -name "*.txt" -exec wc -l {} \;
```

En el comando anterior:
  - `-exec` es la expresión que le dice a `find` que ejecute el siguiente comando.
  - `wc -l` es el comando *wordcount* (`wc`) con la opción de conteo de líneas (`-l`).
  - `{}` aquí, `find` colocará el nombre del archivo encontrado para ejecutar
  el comando.
  - `\;` Es parte de la sintaxis necesaria para que `-exec` funcione correctamente.


Otra manera de lograr resultados similares es utilizar `xargs` .

```bash
find . -name "*.txt" | xargs wc -l
```
En el supuesto de que necesitemos especificar la posición del argumento en el comando que se intenta ejecutar; por ejemplo en `cp` dónde la sintaxis es `cp archivo_origen archivo_destino` se puede utilizar `xargs` con la opción `-I` y un caracter que será reemplazado durante la ejecución del comando ( en este ejemplo será el caracter '%' ).

```bash
find . -name "*.txt" | xargs - I % cp % /path/destino
```

---
## Notas finales

`find` es un programa muy poderoso que te permite encontrar archivos y directorios
en función de su tamaño, fecha de modificación, entre otras opciones. Anímate a 
aprender más. Recuerda que puedes usar el comando `tldr` para encontrar guías
rápidas.



































![header](/Tutoriales-IFC/assets/header.png)

