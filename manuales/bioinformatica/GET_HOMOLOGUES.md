
![header](/Tutoriales-IFC/assets/header.png)







# GET_HOMOLOGUES: Prueba rápida de homologías 

## I. Amigable advertencia
 
El "rápido" es un decir. Antes de que empieces a utilizar esta herramienta de código libre llamada [GET_HOMOLOGUES](https://github.com/eead-csic-compbio/get_homologues) debes tener en cuenta que debido a la naturaleza del programa, correrlo puede ser bastante demandante en cuanto a poder de cómputo. Por lo que, como recomendación personal, te sugiero conseguir un equipo con un CPU de al menos 4 núcleos de procesamiento para no saturar tu computadora y no esperar mucho tiempo para obtener resultados. 

No es que no puedas correr esta herramienta en un ordenador muy básico, pero de no contar con estos requerimientos mínimos podrías pasarte horas y horas esperando a que termine la tarea en cuestión, aunque el tiempo depende enteramente de la naturaleza de tus secuencias problema. Con eso aclarado, comencemos por lo que nos interesa:

**¿Qué es GET_HOMOLOGUES? Y ¿cómo me ayuda a mi en mi investigación?**

## II. Situación hipotética

Supongamos que tienes una serie de secuencias de nucleótidos o aminoácidos de un mismo organismo, pero de distintas especies. Secuencias de genes o proteínas que sabes son homólogos, pero quieres saber más. ¿Toda el gen/proteína es igual? Hay partes más conservadas que otras? ¿Cuál o cómo es el genoma núcleo (_core genome_)? ¿Cómo está compuesto el pangenoma (_pangenome_)? Tienes preguntas muy interesantes entre las manos, pero ¿cómo responderlas?

## III. La respuesta corta
[GET_HOMOLOGUES](https://github.com/eead-csic-compbio/get_homologues) es una herramienta que fue inicialmente diseñada para el estudio de genomas bacterianos en formato GenBank, pero también puede ser utilizada para el análisis de sets eucarióticos. Aunque en dado caso la definición de core- y pan- genoma puede cambiar, y las regiones intergénicas pueden ser más largas. Sus funciones se pueden resumir en:

1. Agrupamiento de secuencias nucleotídicas y proteicas en grupos homólogos (posibles ortologos), basado en las similitudes de secuencias.
2. Identificación de grupos ortologos en regiones intergenicas, que colindan con *orthologous open reading frames* conservados a través de genomas emparentados.
3. **Definición de pan y core genomas mediante el cálculo de _overlappings_ en los sets proteicos.**

Esta guía te procura instrucciones simples suponiendo que eres relativamente nuevo en el uso de este software. La documentación oficial puede ser agobiante y por ello aquí te presentaremos un ejemplo de uso de GET_HOMOLOGUES para obtener tu genoma núcleo, pangenoma y la mejor composición de los mismos desde el punto de vista estrictamente estadístico.

## IV. ¿Por dónde empezamos?

Nuestros elementos esenciales para trabajar son los siguientes:

a) Secuencias (Nucleótidos o Aminoácidos)

b) Algoritmos de agrupamiento (_Clustering algorithms_)


### Archivos de entrada: Secuencias
Los tipos de archivos soportados son .gbk y .faa 

Sin embargo, si utilizas archivos .faa sólo obtendrás agrupamientos de secuencias proteicas, en contraste a utilizar archivos .gpk que te regresará grupos proteicos y nucleótidos.

En caso de que tu trabajo implique el uso de ambos tipos de archivos, la _Tabla 1_ resume lo que necesitas para obtener uno o dos agrupamientos o _clusters_.


_Tabla 1. Archivos aceptados para GET_HOMOLOGUES, tomado de el manual para el mismo_

| TIPO DE ARCHIVO    | CLUSTER DE SALIDA |
|--------------------|-------------------|
| .gbk               | AA+ADN            |
| .faa               | AA                |
| .gbk & .faa        | AA                |
| .faa & .fna        | AA + ADN          |
| .gbk & .faa & .fna | AA + ADN          |


Si en lugar de darle los archivos directamente prefieres darle un directorio, utiliza la opción [-d]. Cabe recalcar que si utilizas un directorio lo mejor sería que fueran archivos del tipo GenBank, ya que permite añadir nuevos archivos en el futuro **reduciendo el tiempo de computo** requerido para análisis actualizados. ¡Pero si ocupas archivos FASTA no se acabará el mundo!


### Algoritmos de agrupamiento

Los algoritmos de agrupamiento son importantes porque dependiendo de qué algoritmo que escojas, tendrás resultados específicos. GET_HOMOLOGUES permite el uso de 3 algoritmos distintos: **BDBH, COGtriangles y OMCL**. Estos son algoritmos que utilizan **métodos heuristicos  de "best match" basados en BLAST**, que son en general los más adecuados para **bacterias** y más prácticos para **grandes sets de datos** (por ello son los más comúnes en genómica comparativa).

- **BDBH** - [default] _Bidirectional Best Hit_ agrupa con criterios de:
    - % de cobertura del alineamiento
    - % mínimo de identidad de secuencias
    - Corte de E-score
    - Sintenia (conservación del orden de los genes entre segmentos)
   
- **COGs** - [-G] _Clusters of Orthologous Groups_ cuyo método de agrupación consiste en que un grupo ortologo es aquel que es compartido en al menos tres linajes diferentes. Esto genera triángulos de similitud que son agrupados a lo largo del análisis para ser posteriormente separados de aquellos grupos que no tuvieron el mismo nivel de saturación ya sea entre multidominios proteicos o mezclas complejas. 

- **OMCL** - [-M] _Ortho Markov Clustering Process_ forma grupos ortologos utilizando el algoritmo de agrupamiento Markov. 

### ¿Y cuál es para mi?

La verdad es que la mayor parte del tiempo utilizarás los tres! A menos que busques resultados de un solo algoritmo, trabajar los tres te permite generar consensos para resultados más precisos. ¿Qué aporta cada algoritmo?

- BDBH - **No sirve para pan-genomas, solo genomas núcleo**. GET_HOMOLOGUES utiliza una versión heuristica que no agrupa resultados del blast TODO_vs_TODO, solo contra el genoma más pequeño (default) o un genoma de referencia. Por ello solo puede calcular genomas núcleo!
- COGs - Sirve para ambos (pan & core)
- OMCL - Sirve para ambos (pan & core)

 Una de las ventajas de GET_HOMOLOGUES es la capacidad de comparar clusters para generar un consenso utilizando los tres algoritmos. Crea un **consenso de genoma nucleo** utilizando los resultados de los tres algoritmos, y otro **consenso para pangenomas** utilizando solo COGs y OMCL, por lo anteriormente mencionado. 



## 1. Instala GET_HOMOLOGUES

La guía de instalación la puedes encontrar directamente en el [manual](http://eead-csic-compbio.github.io/get_homologues/manual/manual.html#SECTION00030000000000000000) del repositorio. Si necesitas ayuda extra para la instalación revisa el documento anexo de _install_help_ en el [repositorio](https://github.com/UBMI-IFC/Tutoriales-IFC/tree/main/manuales/bioinformatica/_GET_HOMOLOGUES) de la UBMI del Instituto de Fisiología Celular de la UNAM. En esta guía, lo instalaremos clonando el repositorio y añadiéndolo a nuestro PATH.

Puedes corroborar si está instalado con:

`get_homologues.pl -v`
 


## 2. Secuencias problema

Para este pequeño ensayo ocuparemos secuencias de cepas de bacterias de _Pseudomonas aeruginosa_ para nuestro primer ensayo. Así que primero lo primero, organicemos nuestro espacio de trabajo.

a) Crea una carpeta de trabajo, puedes llamarla _Pseudomonas_

b) Copia en _Pseudomonas_ las secuencias a trabajar que encuentras en el [repositorio](https://github.com/UBMI-IFC/Tutoriales-IFC/tree/main/manuales/bioinformatica/_GET_HOMOLOGUES). En este caso le llamaremos a esta carpeta _faa_ (por ser secuencias en formato fasta).

c) (Opcional) Crea un archivo de texto con una guía para ti donde listes lo que hay en cada carpeta creada y por crear. Es útil para no perder el hilo de las cosas. Tómala como una especie de bitácora personal.

### 2.1 Ubicándonos en el área de trabajo

Como método de buena praxis, es recomendable que guardes tus directorios de trabajo temporalmente en tu terminal para que puedas navegar dentro de las carpetas de trabajo sin perder el ritmo de trabajo. Por ahora es importante que sepas que habrá 4 carpetas principales a las cuales les asignaremos _alias_ para desplazarnos a ellas de manera rápida:

- $top_dir = Carpeta donde se encuentran la subcarpeta _faa_, _faa_homologues_ (creada en el punto 3), y el archivo opcional de texto mencionado anteriormente.

- $blast_dir = Subcarpeta que al correr get_homologues por primera vez se le asignará el nombre _faa_homologues_, donde estarán los resultados de los BLAST.

- $pan_dir = Subcarpeta contenida en el $blast_dir que se genera al crear los consensos para pangenomas en el punto 6.2 de esta guía.

- $core_dir = Subcarpeta contenida en el $blast_dir que se genera al crear los consensos para _core_ genomas en el punto 6.1 de esta guía.


La manera en que creamos estos atajos es así. En tu terminal desplázate a la carpeta a la que le asignarás el _alias_, en este caso será donde tenemos la subcarpeta contenedora de secuencias _faa_, y luego escribe:

`top_dir=$(pwd)`

Lo que esto hace es guardar la ruta de este directorio con el nombre _$top_dir_. Puedes comprobar que en efecto es la carpeta correcta con:

`echo $top_dir`

Deberías obtener una respuesta como la siguiente:


`/home/usuario/Documentos/Pseudomonas`

Si hicieras lo mismo en la carpeta que contiene tus secuencias en formato FASTA con el nombre $faa_dir, sería:

`faa_dir=$(pwd)`

Y comprobamos con:

`echo $faa_dir` 

Con una respuesta así:

`/home/usuario/Documentos/Pseudomonas/faa`


La ventaja de hacer esto es meramente para agilizar tu flujo de trabajo. Con esto tu puedes estar en cualquier carpeta dentro de tu computadora cambiar de directorio con un solo _cd_. Si estamos en la carpeta _Documentos_ y queremos llegar a la carpeta con los consensos de pangenomas:

`cd $pan_dir`


**Nota: Son variables temporales. En cuanto cierres tu terminal, estas se perderán y tendrás que crearlas nuevamente.**


 

## 3. Obteniendo _core-genomes_ - BDBH


Comencemos corriendo el BDBH. Ubicate en tu $top_dir y ejecuta lo siguiente: 

`get_homologues.pl -d faa -t 10 -e -n 2`

Aqui puedes modificar el argumento `-n 2` por el número de núcleos que quieras dedicar a esta tarea. Por default ocupa 2 núcleos pero puedes asignarle los que quieras siempre y cuando no satures a tu computadora.

Puedes revisar cuantos núcleos disponibles tienes con:

`awk '/^proc/ {n++} END{print n}' /proc/cpuinfo`


Los resultados los encontrarás en un nuevo directorio con el mismo nombre de la carpeta que usaste más la terminación "homologues". Por ejemplo: 

_faa_homologues_


## 4. Obteniendo _pan-genomes_

### 4.1 COGtriangles

`get_homologues.pl -d secuencias -G -t 0`

### 4.2 OMCL

`get_homologues.pl -d secuencias -M -t 0 -c`

En este caso particular, el argumento adicional [-c] le indica a GET_HOMOLOGUES que procese la composición del core- y pan- genoma mediante el muestreo al azar de 10 pares de genomas para procesar los numeros observados de genes nuevos y en comun. La carpeta con los resultados se guardan  la misma _secuencias_homologues_ en: 

_core_genome_algOMCL.tab_ y _pan_genome_algOMCL.tab_

**Estas tablas son utilizadas por _plot_pancore_matrix.pl_ para generar las gráficas de tus datos.**

Puedes asegurarte de que estén tus tablas en tu directorio con:

`ls *tab`

## 5. Graficando resultados

Utilizaremos _plot_pancore_matrix.pl_ para graficar. Puedes obtener información del mismo con: 

`plot_pancore_matrix.pl -h`

    plot_pancore_matrix.pl -i core_genome_algOMCL.tab -f core_both
    plot_pancore_matrix.pl -i pan_genome_algOMCL.tab -f pan

Nota que utilizamos una opción especial de fit (-f) especificando que utilice los dos tipos disponibles: Función de Tettelin y Willenbrock. Esto es para tener ambos ajustes dentro de la gráfica resultante.


Puedes revisar los resultados con tu visor de preferencia. O si estas en un servidor remoto, puedes utilizar `eog` o firefox para visualizar los archivos .png.

    eog core_genome_algOMCL.tab_core_both.png &
    eog pan_genome_algOMCL.tab_pan.png &

Ojo, por favor! Estos son resultados preliminares y obtenidos de extrapolación! Eso significa que debes tomar estos gráficos como solo un primer acercamiento gráfico a lo que tienes entre manos. Si bien estos gráficos te dan una idea de cuán grande es tu _core_ y pan genoma, estos resultados aún pueden ser pulidos con:

- [Get_phylomarkers](https://github.com/vinuesa/get_phylomarkers) 
- Mejores muestras. La calidad de tus resultados siempre va a depender de la calidad de tus secuencias!

## 6. Consensos para BDBH, COGtriangles y OMCL

Utilizaremos `compare_clusters.pl` para esto. Ocuparemos los subdirectorios ocultos (que empiezan con . ) de resultados específicos por algoritmo, puedes buscarlos con:

`find . -type d`

### 6.1 Consensos para core-genomes

Corre el siguiente código, es importante que no haya espacios innecesarios. El argumento `-o core_BCM` es para que tus resultados se guarden en el directorio _core_BCM_, pero puedes cambiarlo por otro nombre que te sea familiar.

`compare_clusters.pl -d ./GCF000468555_f0_20taxa_algBDBH_e1_,./GCF000468555_f0_0taxa_algCOG_e0_,./GCF000468555_f0_0taxa_algOMCL_e0_ -o core_BCM -t 20`


---------------------------------------------------------------------

En este material de ejemplo utilizamos secuencias de proteínas, pero si utilizaramos archivos .gbk ejecutaríamos como parte extra:

`compare_clusters.pl -d ./GCF000468555_f0_20taxa_algBDBH_e1_,./GCF000468555_f0_0taxa_algCOG_e0_,./GCF000468555_f0_0taxa_algOMCL_e0_ -o core_BCM -t 20`

---------------------------------------------------------------------

Cambia al directorio _core_BCM_ y explora los datos que tengas. En este caso, porque nuestras secuencias son todas .faa (proteínas) solo tenemos resultados .faa, si hubieramos utilizado otros archivos que permitieran el análisis a nivel nucleótido encontraríamos también archivos .fna. Puedes revisar el diagrama de venn con los consensos de core-genomes de nuestras secuencias con

`eog venn_t20.pdf`


### 6.2 Consensos para _pan-genomes_


 
Recuerda que **nunca** vamos a meter a pangenomas el directorio creado por el algoritmo BDBH, ya que no tiene la información necesaria para generar pangenomas

`compare_clusters.pl -d ./GCF000468555_f0_0taxa_algCOG_e0_,./GCF000468555_f0_0taxa_algOMCL_e0_ -o pan_CM -m -n -T`

Aqui exploraremos algo interesante. Muevete a tu nuevo directorio _pan_CM_ para explorar la composición de nuestro pangenoma.

    grep -c '>' *faa | sed 's/:/\t/' | sort -nk2
    

Ese es tu pangenoma y la ocurrencia de cada gen dentro del mismo. Los genomas que cuentan de 1-20 son los "cloud", que te meten puro relleno! Puedes guardarlo para revisarlo con calma más adelante:


grep -c '>' *faa | sed 's/:/\t/' | sort -nrk2 > pan-genome_cluster_compositon_stats.tsv
    
Exploremos un poco más!

grep -c '>' *faa | sed 's/:/\t/' | cut -f2 | sort -n | uniq -c | awk 'BEGIN{OFS="\t"; print "size\tcount"}{print $2,$1}' 

## 7. Graficando el _cloud_, _shell_, _soft_core_ y _core_ genomas

En este punto hemos casi terminado con el procesamiento de nuestros datos, pero todo lo que hemos obtenido hasta ahora no tenemos valores estadísticos con los que podamos sustentar nuestros resultados. En este punto obtenemos dos elementos importantes:

- Gráfica de distribución desde _cloud_ hasta _core_ genomas.
- El mejor modelo que describe nuestras secuencias abalado por el criterio de información Bayesiano (BIC) 


Corremos lo siguiente dentro del directorio _pan_CM_:

`parse_pangenome_matrix.pl -m pangenome_matrix_t0.tab -s`

Puedes buscar tu gráfica de barras con:

`ls *png`

Tendrás dos gráficas interesantes: de círculo y de barras. Ambas describiendo la distribución del pangenoma para tu secuencias.

### 7.1 Criterio de Información Bayesiano (BIC)

Notaras que corriendo este último comando la terminal te devuelve una pequeña tabla con datos como:

1. Core_size
2. Pan_size
3. BIC
4. LogLikelihood

En este caso, el BIC es el que nos interesa para obtener el modelo que mejor describe a nuestras secuencias. Por lo que el que mejor se ajusta para nuestras secuencias tendrá el **valor de BIC más pequeño.**

Por ejemplo:

`Core.size Pan.size BIC LogLikelihood

- 2 components 3731 10845 120384.436328685 -60178.2827743496
- 3 components 3413 13506 41728.7253227292 -20841.1370113767
- 4 components 2428 18814 37322.9589144135 -18628.9635472237
- 5 components 1631 25198 36407.7131366125 -18162.0503983281
- 6 components 775 24938 36401.7267787591 -18149.7669594062
- 7 components 1144 25307 36441.9859519119 -18160.6062859875
- 8 components 25 16355 36846.2739272125 -18353.4600136426
- 9 components 1123 28233 36444.7357082131 -18143.4006441478
- 10 components 0 21667 36506.0668624375 -18164.7759612648

Sample 3735 10832 NA NA `

Estos son resultados diferentes a lo que tu obtendrás, Así que busca por tu cuenta ¿cuál es el modelo que según mi BIC describe mejor mis datos? Recuerda que entre menor sea el valor, más se acerca a la realidad! En estos resultados sería:

`6 components 775 24938 36401.7267787591 -18149.7669594062`

## 8. Resultados

Los resultados interesantes estarán contenidos en varias carpetas, por lo que en este punto sería útil para ti crear una nueva carpeta en _$top_dir_ con los resultados que quieras presentar o analizar más tarde. 


Directorio: _pan_CM_

Creado en el punto 6.2 de esta guía. 

- Diagrama de Venn de composición de pangenoma 
- Lista de genes contenidos en el consenso de pangenomas
- Árbol filogenético estimado de tus secuencias
 
Directorio: _core_BCM_

Creado en el punto 6.1 de esta guía.

- Diagrama de Venn de composición del _core_ genoma
- Lista de genes contenidos en el consenso de _core_ genomas


Directorio: _faa_homologues_ 

- Gráficas de funciones para _core_ y pan-genomas


Terminal: Punto 6.2	| Directorio: _pan_CM_

- Modelo de mejor ajuste de acuerdo con el BIC
- Gráfica de barras/círculo de distribución de _cloud, shell, soft core y core_ genomas.








![header](/Tutoriales-IFC/assets/header.png)

