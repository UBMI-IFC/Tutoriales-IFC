
![header](/Tutoriales-IFC/assets/header.png)



# Creación de Modelos Ocultos de Markov y su uso para análisis de secuencias proteicas con HMMER: Una guía de uso

**¿Porqué es esto útil para mi?** HMMER es una herramienta muy útil en
las búsquedas de homologías remotas de secuencias. Por ejemplo, si
tuvieras una proteína parecida estructural y molecularmente a otra y
tuvieras la sospecha de que pueden estar emparentadas por un ancestro
común, la pregunta natural sería ¿cómo lo confirmó? HMMER utiliza
modelos probabilísticos para que la respuesta sea lo más precisa
posible.

¿Dónde empezamos? Necesitarás familiarizarte con dos elementos
esenciales:

- Modelo Oculto de Markov (MOM o perfil), que actuará como
  “muestrario”. Contiene todas las características que definen a tu
  secuencia problema (proteínas, dominios proteicos, etc.) y es lo que
  HMMER utiliza para escanear el siguiente elemento esencial.
- La base de datos. Puedes verla como una gran biblioteca de
  secuencias, en la cual HMMER buscará y valorará homologías con el
  perfil que se le haya dado.

Los resultados que obtengas de un ejercicio como el que haremos a
continuación serán el **valor de probabilidad de que tus coincidencias
se hayan dado al azar**, por lo que entre menor sea el *e-value* mejores
noticias son para ti! Aquí aprenderás a utilizar HMMER para que con un
MOM puedas escanear una base de datos entera en busca de homologías de
tu secuencia problema.

## Instrucciones

Descarga e instala [HMMER](http://hmmer.org/) para comenzar. De
preferencia utuliza un sistema Linux, pero si trabajas con Windows
puedes instalarlo mediante [Anaconda
Navigator](https://anaconda.org/anaconda/anaconda-navigator). Sigue las
[instrucciones para su
instalación](http://eddylab.org/software/hmmer/Userguide.pdf) incluídas
en la documentación de HMMER.

Encontrarás en este tutorial 2 carpetas principales:

1. Secuencias_semilla
2. Base_de_datos

La carpeta de Secuencias_semilla contiene 5 secuencias proteicas de
Quitina Sintasa. Las llamaremos **secuencias semilla** ya que a partir
de estas crearemos nuestro perfil. La segunda carpeta contiene un
archivo con varias secuencias proteicas que actuarán como nuestra base
de datos de ejemplo. Descárgalas y ubícalas en una carpeta que puedas
encontrar y trabajar fácilmente.

## Creación de un Modelo Oculto de Markov a partir de secuencias específicas: hmmbuild

### Obtención de secuencias semilla

#### Bases de datos

Puedes obtener tus secuencias con las que trabajarás de cualquier base
de datos pública (GenBank o UniProt, por mencionar algunas) dependiendo
de lo que tu trabajo requiera. En esta guía utilizaremos **secuencias
semilla** obtenidas de UniProt y un fragmento del RefSeq disponible en
GenBank.

#### De 1000 a 1

Puede que tengas diez, cien o mil secuencias que desees utilizar para tu
trabajo, pero no podemos cargar archivo por archivo a HMMER. Necesitamos
**un solo archivo que contenga a todas tus secuencias**. Por supuesto,
podrías copiar y pegar una por una en un solo archivo, pero con Linux
podemos acortar esta tediosa tarea!

1. **Ubica** todas tus secuencias a trabajar en una sola carpeta. Es
   importante que todos tus archivos tengan la misma extensión (.FASTA,
   .fa, .txt, etc).
2. Las secuencias frecuentemente vienen con nombres y claves extensas.
   Ya que necesitaremos más adelante poder ver los nombres de nuestras
   secuencias rápidamente, **modifica** lo más posible el encabezado de
   tus archivos de modo que podamos ver la información escencial para
   reconocerlas.

Por ejemplo:

Antes:

    > tr|Q5KDB2|Q5KDB2_CRYNJ Chitin synthase OS=Cryptococcus neoformans var. neoformans serotype D (strain JEC21 / ATCC MYA-565) OX=214684 GN=CNG04660 PE=4 SV=1

Después:

    > Q5KDB2_CRYNJ Chitin synthase [Cryptococcus neoformans var. neoformans serotype D] 

4. Ubica tu terminal en la carpeta de todas tus secuencias, o bien
   navega hasta ella.

5. Ejecuta el siguiente comando:
   
   `$ cat *.fasta > secuencias_unidas.fasta`

Lo que hace es buscar todos los archivos que cuenten con la extensión
que le indiques (.fasta en este caso) y los juntará en un nuevo archivo
con el nombre que elijas. En este punto puedes cambiar la extensión de
tu nuevo archivo, pero de preferencia ocupa el mismo tipo de archivo de
tus secuencias semilla.

Este será tu **archivo base**, procura no modificarlo ni perderlo de
vista en caso de que encuentres algún problema futuro.

### Alineamiento Múltiple

Ahora necesitamos alinear tu **archivo base**. Dependiendo de tus
secuencias, del tipo de trabajo que realices y de tu preferencia puedes
usar MUSCLE, MAFFT, TCoffee, Probscon o cualquier otro método de
alineamiento múltiple de secuencias.

El alineamiento resultante estará a tu juicio si necesita modificaciones
como recortar el alineamiento para aislar intervalos del mismo
(dominios, primers, segmentos especiales, etc) o la eliminación de gaps.

A este archivo final con tus secuencias alineadas y modificaciones
opcionales lo llamaremos **archivo alineado**. Y con este podemos pasar
a la última parte de nuestro trabajo!

### Creando un perfil a partir de un alineamiento múltiple: hmmbuild

El comando `hmmbuild` toma dos argumentos principales:

1. El nombre que le pondrás a tu perfil

2. El alineamiento múltiple. En este caso tu **archivo alineado**
   
   `hmmbuild modelo_hmm.hmm archivo_alineado.fasta`

Con esto habrás creado tu perfil con el nombre que especificaste. Puedes
revisarlo de esta manera:

`less modelo_hmm.hmm`

Con tu modelo creado, puedes utilizarlo para buscar homologos en una
base de datos de tu elección.

## Usando el perfil creado para escanear una base de datos: hmmsearch

No podemos adjuntar una base de datos entera ya que son enormes, por lo
que tendrás que consultarla y descargarla por tu cuenta. Por el momento,
utilizaremos un fragmento del RefSeq a modo de ejemplo para practicar.
Utilizar `hmmsearch` es bastante sencillo, el comando toma dos
argumentos principales:

1. El perfil con el que trabajarás (modelo_hmm.hmm)
2. La base de datos a escanear (databased.faa)

De modo que tu línea de código quedará:

`hmmsearch -o output.faa --tblout table.faa modelo_hmm.hmm databased.faa`

Notarás que agregamos dos argumentos más: `-o` (Imágen 1) y `--tblout`
(Imágen 2). Estos crean un archivo con los resultados que puedes
consultar de manera sencilla desde la terminal o desde tu editor de
textos: uno en formato estándar y otro con un formato de tabla,
respectivamente. Claro estos son completamente opcionales y puedes
revisar la
[documentación](http://eddylab.org/software/hmmer/Userguide.pdf) de
*hmmsearch* para más información.


Imágen 1. Ejemplo de hoja de resultados normal con un alineamiento
hecho con MAFFT (Editor de Textos).![Terminal_mafft_t](https://user-images.githubusercontent.com/78200223/174672480-2d7b9a7b-871e-4f7d-b863-9ba1dbffd181.png)


Imágen 2. Ejemplo de tabla de resultados con un alineamiento hecho con
MAFFT
![Editor_mafft_o](https://user-images.githubusercontent.com/78200223/174672499-21703801-0a22-4a2c-bfa4-f7f38fcc7f54.png)

## Interpretación de resultados

Notarás que tus resultados contienen mucha información útil. Los
“mejores” resultados aparecen al principio de tus resultados con un
*e-value* que, idealmente, será menor a 0.05. Sin embargo, este valor no
es definitivo y requiere un poco de sentido común. Dependiendo de tu
trabajo y de los resultados que busques definirás dónde marcar una línea
que definirá si tus resultados son significativos o no. Piénsalo así:

**Cuando el *e-value* \<\<1, el resultado en significativo. Mientras que
si es igual o mayor a 1 el resultado representa un nivel de similitud
débil que pudo haber ocurrido al azar**

El *e-value* no es un puntaje, es un valor de probabilidad de que
determinado resultado se haya dado al azar o no. Por ello entre menor
sea el valor, más seguros podemos estar que no se dió por simple
casualidad!

```python

```



![header](/Tutoriales-IFC/assets/header.png)

