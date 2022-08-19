
![header](/Tutoriales-IFC/assets/header.png)












# Ambientes virtuales de Anaconda (conda).

Anaconda es una distribución de *software* científico para distintos sistemas
operativos. Incluye una gran cantidad de programas que pueden ser útiles
para el análisis y visualización de datos en ciencia.

Una de sus características más relevantes es la capacidad de crear ambientes
virtuales donde se pueden tener encapsulados programas y sus dependencias de 
forma aislada al resto de los programas de la computadora. Esto limita el
riesgo de instalar programas conflictivos ya que cada uno puede estar 
instalado en su propio ambiente virtual.

---
## Operaciones habituales y tips de la UBMI-IFC para usuarios nuevos de Anaconda

Trabajar con ambientes virtuales es muy sencillo pero hay que seguir algunas recomendaciones. . .

### Instala Miniconda no Anaconda

Esto es completamente opcional, pero actualmente es dificil que alguien le saque provecho a todo lo que viene incluido con la instalación base de Anaconda, [Miniconda](https://docs.conda.io/en/latest/miniconda.html#installing) proveé de una instalación lígera que permite realizar todas las operaciones a continuación.

La instalación es muy sencilla, para GNU/Linux descargamos el script de instalación y desde una terminal ejecutamos

1. Cambiamos los permisos para poder ejecutar el script
``` bash
$ chmod 755 ./Miniconda3-py37_4.12.0-Linux-x86_64.sh 
```
2. Corremos el script y seguimos las instrucciones en pantalla

``` bash
$ chmod 755 ./Miniconda3-py37_4.12.0-Linux-x86_64.sh 
```
3. Reiniciamos la terminal y ahora antes del prompt deberia aparecer lo siguiente:

``` bash
(base) $
```
Esto nos indica que Anaconda/Miniconda se ha instalado correctamente

### Instala mamba

Anaconda tiene un instalador de paquetes y manejador de environments llamado `conda` sin embargo aunque hace muy bien lo último, cada vez le cuesta mas trabajo gestionar e instalar software así como crear ambientes, es por ellos que se ha desarrollado `mamba`. 

Te sugerimos que sigas las siguientes recomendaciones de uso 


| Comando  | Uso  |
|---|---|
| `conda`   |  Cambiar (Activar / Desactivar ) ambientes virtuales   |
| `mamba`  | Instalar software y crear ambientes virtuales    |


__Te recomendamos que intentes mantener tu ambiente base lo mas limpio posible, es decir que instales el menor número de cosas en el__ sin embargo una de las excepciones a esta regla es precisamente `mamba`

instálalo de la siguiente manera. 

``` bash
(base) $ conda install -c conda-forge mamba
```
después de instalar `mamba` si tienes que instalar cualquier cosa con `conda` simplemente sustituye el comando por `mamba` 

__nota:__ en el comando de instalación se utilizó la opción `-c conda-forge` esto especifica un "canal" esto ocurre por que no todo el software allá afuera está disponible desde el repositorio principal de Anaconda, en nuestra area mucho del software que nos resulta útil puede estar en los canales `conda-forge` y principalmente `bioconda`. 

###  Creando ambientes virtuales

La mejor forma de trabajar con Anaconda es a través de ambientes virtuales, esto nos permite tener una instalación encapsulada de manera que los programas instalados en ella no interfieran con el resto de programas en la computadora o en otros ambientes virtuales. 

Existen [varias](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) maneras de crear ambientes virtuales, revisaremos las que creemos te serán  de mayor utilidad: 

#### Crear un ambiente virtual vacío


``` bash
(base) $ mamba create -n {el nombre de tu ambiente}
```

ahora puedes cambiar a ese ambiente usando: 


``` bash
(base) $ conda activate {el nombre de tu ambiente}
```

y tu terminal deberia cambiar por algo como esto: 


``` bash
({el nombre de tu ambiente}) $ 
```
__nota__ que usamos `mamba` para crear el ambiente y `conda` para acceder a el.

puedes ver  los ambientes virtuales que tienes instalados con el comando

`conda env list`

esto te permite conocer los nombres y las ubicaciones de todos ellos ,además el ambiente marcado con un __*__ indica el ambiente activo en ese momento

_ejemplo:_

``` bash
(prueba) $ conda env list
# conda environments:
#
bioR                     /home/cperalta/.conda/envs/bioR
prueba                 * /home/cperalta/.conda/envs/prueba
pymol-env                /home/cperalta/.conda/envs/pymol-env
rstudio-env              /home/cperalta/.conda/envs/rstudio-env
spyder-env               /home/cperalta/.conda/envs/spyder-env
base                     /home/seisbio/mambaforge

```

Ahora puedes instalar software dentro del environment usando: 


``` bash
({el nombre de tu ambiente}) $ mamba install  {el nombre de tu programa a instalar}
```
Típicamente si tu programa requiere especificar un canal en específico vendrá en la documentación del mismo.

Para volver al ambiente base sólo escribiremos en la terminal: 


``` bash
({el nombre de tu ambiente}) $ conda deactivate 
```
#### Creando un environment con todo y programas

Es posible la creación de un ambiente y la instalación de programas en un sólo paso. 


``` bash
(base) $ mamba create -n {{el nombre de tu ambiente}} {{-c si-lo-requiere }} {{el nombre de tu programa, o programas}}
```
#### Creando un ambiente a partir de un archivo de configuración


Esta es la forma más facil de crear un ambiente con todo su contenido, para ello es necesario un archivo __yml__ que usualmente te compartirá un usuario o el desarrollador de alguna aplicación y ahora ubicándote en la carpeta que contiene dicho archivo sólo tienes que ejecutar 

``` bash
mamba env create -f {tu_archivo}.yml
```

__REGRESA PRONTO PARA VER UNA ACTUALIZACIÓN DE ESTE REPOSITORIO__

---

## Conoce más

Manejando ambientes virtuales gráficamente con anaconda-navigator:

- [Documentación](https://docs.anaconda.com/anaconda/navigator/tutorials/manage-environments/)

[![IMAGE ALT TEXT](http://img.youtube.com/vi/AVvqUTE3QWI/0.jpg)](http://www.youtube.com/watch?v=AVvqUTE3QWI "Video Title")

Manejando ambientes virtuales desde la línea de comandos (conda):
- [Documentación](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file)







![header](/Tutoriales-IFC/assets/header.png)

