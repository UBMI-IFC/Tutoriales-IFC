# TLDR 

## Olvídate de Google para saber como ejecutar un comando

Si usando la línea de comandos de GNU/Linux se te ha olvidado como usar un programa en particular y te dá flojera leer tooooda la ayuda del mismo usando `--help` ó el `man` es gigante e incomprensible, `tldr` es para tí

__tldr__ es un comando con instrucciones simplificadas para muchos programas de la linea de comando usarlo es muy sencillo...

```bash
$ tldr <el_programa_que_no_sabes_como_usar>
```
y listo

Por ejemplo digamos que no recuerdas como usar `tar` para descomprimir un archivo:

```bash
$ tldr tar

Archiving utility.Often combined with a compression method, such as gzip or bzip2.More information: https://www.gnu.org/software/tar.

 - [c]reate an archive and write it to a [f]ile:
   tar cf {{target.tar}} {{file1}} {{file2}} {{file3}}

 - [c]reate a g[z]ipped archive and write it to a [f]ile:
   tar czf {{target.tar.gz}} {{file1}} {{file2}} {{file3}}

 - [c]reate a g[z]ipped archive from a directory using relative paths:
   tar czf {{target.tar.gz}} --directory={{path/to/directory}} .

 - E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:
   tar xvf {{source.tar[.gz|.bz2|.xz]}}

 - E[x]tract a (compressed) archive [f]ile into the target directory:
   tar xf {{source.tar[.gz|.bz2|.xz]}} --directory={{directory}}

 - [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:
   tar caf {{target.tar.xz}} {{file1}} {{file2}} {{file3}}

 - Lis[t] the contents of a tar [f]ile [v]erbosely:
   tar tvf {{source.tar}}

 - E[x]tract files matching a pattern from an archive [f]ile:
   tar xf {{source.tar}} --wildcards "{{*.html}}"

```

Cómo ves te da las instrucciones en un formato muy simple para ejecutar las funciones mas frecuentes de un programa.

A menudo se actualizan las entradas de `tldr` así que puedes obtener las versiones mas recientes con:

```bash
$ tldr -u
```

Si aún no lo tienes instalado en tu computadora instálalo con:


```bash
$ sudo apt-get install tldr
```

Cónoce mas en su [pagina](https://tldr.sh/) oficial
