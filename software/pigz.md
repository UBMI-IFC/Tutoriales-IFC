
![header](/Tutoriales-IFC/assets/header.png)

# Compresión y descompresión rápida con pigz 

## ¿Una versión mejorada de gzip?

Una de las tareas más comunes cuando se trabajan con datos de secuenciación u otros de origen biológico es comprimirlos o descomprimirlos, en particular archivos en formato **.gz**.

Por su gran tamaño esta puede ser una tarea que demora bastante tiempo. Una opción es utilizar GNU Parallel tal como lo sugiere la entrada de [tldr](https://ubmi-ifc.github.io/Tutoriales-IFC/software/tldr) para parallel

```bash
- Gzip several files at once, using all cores:
   parallel gzip ::: {{file1}} {{file2}} {{file3}}

```

Sin embargo parallel puede ser muy poderoso pero no es necesariamente [sencillo de utilizar](https://www.gnu.org/software/parallel/parallel_tutorial.html), afortunadamente existen otras opciones, recientemente nos encontramos con pigz (pig-zi) que tiene como objetivo acelerar las operaciones de compresión y descompresión de archivos.

La entrada de tldr de pigz nos muestra ejemplos de uso bastante entendibles


```bash
pigz
Multithreaded zlib compression utility.More information: https://github.com/madler/pigz.

- Compress a file with default options:
pigz {{path/to/file}}

- Compress a file using the best compression method:
pigz -9 {{path/to/file}}

- Compress a file using no compression and 4 processors:
pigz -0 -p{{4}} {{path/to/file}}

- Compress a directory using tar:
tar cf - {{path/to/directory}} | pigz > {{path/to/file}}.tar.gz

- Decompress a file:
pigz -d {{archive.gz}}

- List the contents of an archive:
pigz -l {{archive.tar.gz}}

```

Cónoce más en su [pagina](https://zlib.net/pigz/) oficial

![header](/Tutoriales-IFC/assets/header.png)

