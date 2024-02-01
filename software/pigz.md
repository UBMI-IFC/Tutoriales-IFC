
![header](/Tutoriales-IFC/assets/header.png)

# Compresión y descompresión rápida con pigz 

## ¿Una versión mejorada de gzip?

Una de las tareas más comunes cuando se trabajan con datos de secuenciación u otros de origen biológico es comprimirlos o descomprimirlos, en particular archivos en formato **.gz**.

Por su gran tamaño esta puede ser una tarea que demora bastante tiempo. Una opción es utilizar GNU Parallel tal como lo sugiere la entrada de [tldr](https://ubmi-ifc.github.io/Tutoriales-IFC/software/tldr) para parallel

```bash
- Gzip multiples archivos usando todos los nucleos disponibles:
   parallel gzip ::: [archivo 1] [archivo 2] ... [archivo n]

```

Sin embargo parallel puede ser muy poderoso pero no es necesariamente [sencillo de utilizar](https://www.gnu.org/software/parallel/parallel_tutorial.html), afortunadamente existen otras opciones, recientemente nos encontramos con pigz (pig-zi) que tiene como objetivo acelerar las operaciones de compresión y descompresión de archivos.

La entrada de tldr de pigz nos muestra ejemplos de uso bastante entendibles


```bash
pigz
Multithreaded zlib compression utility.More information: https://github.com/madler/pigz.

- Comprimir un archivo con opciones default:
pigz [ruta/al/archivo]

- Comprimir un archivo utilizando la máxima compresión:
pigz -9 [ruta/al/archivo]

- Empaqueta un archivo sin comprimirlo usando 4 procesadores:
pigz -0 -p{{4}} [ruta/al/archivo]

- Comprime un directorio usando tar:
tar cf - [ruta/al/directorio] | pigz > [ruta/al/archivo].tar.gz

- Descomprime un archivo:
pigz -d [archive.gz]

- Lista sin descomprimir los contenidos de un archivo comprimido:
pigz -l [archive.tar.gz]

```

Cabe mencionar que de acuerdo a la información oficial de pigz la descompresión no ocurre realmente en paralelo, sin embargo divide en tres procesadores las operaciones de lectura, escritura y verificación lo cuál acelera el proceso en algunos casos, a modo anecdótico nosotros hicimos la siguiente prueba:

Descomprimimos 24 archivos de secuenciación en formato fastq.gz que comprimidos pesaban entre 300 y 500 Mb y descomprimidos entre 1.8 y 2.4 Gb los descomprimimos usando gzip y pigz en un equipo con Ubuntu 20.04, Ryzen 9 5900x, 128 Gb RAM, leyendo y escribiendo en un disco duro mecánico a 5400 RPM.

Resultados:

| Comando | Tiempo de ejecución |
|---------| --------------------|
|`gzip -d *fastq.gz`| > 1 hora  |
|`pigz -d *fastq.gz`| ~ 15 minutos |


Por su facilidad de uso y mejoria en el desempeño nos parece un gran reemplazo de gzip.


Cónoce más en su [pagina](https://zlib.net/pigz/) oficial

![header](/Tutoriales-IFC/assets/header.png)

