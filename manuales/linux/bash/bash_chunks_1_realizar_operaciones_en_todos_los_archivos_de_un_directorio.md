
![header](/Tutoriales-IFC/assets/header.png)









# Realizar operaciones en todos los archivos de un directorio

recuerda que los comandos escritos en este tutorial comienzan con '$' pero no lo debes escribir para reproducir los ejemplos, sólo está indicando que es un comando que se ingresará en una terminal, toma nota también de que el texto entre corchetes __[ejemplo]__ indica que el texto dentro de los mismos lo debes sustituir por otra cosa, y los corchetes __no__ forman parte del comando.
___

## Tutorial

Una de las tareas que mas comúnmente queremos hacer es realizar alguna acción sobre un conjunto de archivos.

Si estos archivos se encuentran en un mismo directorio esto es muy sencillo.

Analizemos este ejemplo:

```bash
#!/usr/bin/bash

# EJEMPLO PARA ITERAR EN LOS ARCHIVOS DE UN DIRECTORIO
# Carlos Peralta  | GitHub: cperalta22 | cperalta@ifc.unam.mx
# Instituto de Fisiología Celular, Universidad Nacional Autonoma de Mexico
# GPL3
# 2023

echo  "Uso ./este_script [path/al/directorio]"
echo

for f in path/al/directorio/*; do
    head $f
done
```
El texto de arriba es un script muy sencillo pero contiene varios elementos:

1. La primer línea `#!/usr/bin/bash` contiene la dirección en la computadora del intérprete de bash, no es estrictamente indispensable puesto que siempre podemos ejecutar el script escribiendo `$ bash [nombre_del_script.sh]` sin embargo es muy útil especialmente cuando ejecutamos el script desde otros programas y más cómodo puesto que si agregamos esta línea podemos ejecutarlo simplemente escribiendo `./[nombre_del_script.sh]`, __Nota__ típicamente el caracter '#' se interpreta como un comentario y __no__se ejecuta, pero cuando este se escribe: __#!__ se le conoce como shebang y es un indicador para leer la dirección del intérprete de bash. Si no conoces la dirección del intérprete puedes escribir en la terminal `$ which bash`
2. A continuación aparece información sobre el autor, la fecha, licencia de uso, etcetera, esto no es estrictamente necesario pero es una buena práctica, __nota__ que todo este segmento del código está precedido por "#" evitando que se intente ejecutar su contenido.
3. Las siguientes dos líneas escritas le dan al usuario una pista de como es que se ejecuta el código, no es la mejor forma de hacerlo pero sin duda es la mas sencilla, la segunda vez que se llama el comando `echo` sin argumentos sólo servirá para dejar un espacio en blanco entre el mensaje y la salida del código
4. __La parte mas importante del código__ es el ciclo _for_ la explicación de esta parte del código es la siguiente:
    - 4.1 `for f in path/al/directorio/*; do` Esta parte del código puede ser confusa; pero la computadora la "lee" de esta forma: _para cada f en el contenido del directorio ejecutar_ dónde f es solo una variable que usamos para representar cada archivo, no tiene que ser la letra f, puede ser cualquier cosa.
    - 4.1 `head $f` Una vez que le hemos dicho a la computadora sobre quienes queremos trabajar, viene el comando o comandos como tal, en este caso la instrucción es imprimir en pantalla las primeras líneas de cada "f" es decir: archivo, __nota__ que para hacer referencia a cada archivo escribimos "$f" y no sólo "f".
    - 4.3 `done` Esta palabra clave le indica a Bash que no debe seguir ejecutando acciones sobre los archivos , es decir se cierra el ciclo.









![header](/Tutoriales-IFC/assets/header.png)

