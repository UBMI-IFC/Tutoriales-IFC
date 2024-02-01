
![header](/Tutoriales-IFC/assets/header.png)

# Instalación de CellProfdiler

## Introducción.

`CellProfiler` es un programa dedicado usado para crear _pipelines_ de análisis de imágenes de microscopía con focal.
La idea es facilitar el procesamiento estandarizado y en lote de muchas imágenes (https://cellprofiler.org/).

En la página de internet se pueden descargar versiones para Windows y MacOS, sin embargo, la isntalación en Linux
es un poco más artesanal. Aquí dejo las instrucciones para instalar la versión 4.

## Instrucciones.

1. Crear un ambiente virtual con las dependencias. Este ambiente está basado en el propuesto en la página de GitHub 
(https://github.com/CellProfiler/CellProfiler/wiki/Conda-Installation). Sin embargo, algunas dependencias no eran
compatibles, en especial `libtiff`. El contenido del archivo `yml` es el siguiente:

```yml
name: cp4

channels:
- conda-forge
- anaconda
- bioconda
- defaults

dependencies:
- python
- pip
- numpy
- matplotlib
- pandas
- mysqlclient
- openjdk
- scikit-learn
- mahotas
- gtk2
- Jinja2=3.0.1
- inflect=5.3.0
- wxpython=4.1.0
- mysqlclient=1.4.4
- sentry-sdk=0.18.0
- libtiff=4.0
```


2. Activar el nuevo ambiente virtual e instalar `CellProfiler` con `pip`.

```bash
pip install cellprofiler
```

![header](/Tutoriales-IFC/assets/header.png)

