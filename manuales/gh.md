
![header](/Tutoriales-IFC/assets/header.png)











# Conéctate con GitHub desde la línea de comandos (Github CLI)

__GitHub CLI__ es la interfáz oficial de línea de comandos para _GitHub_.

Contiene herramientas útiles para crear, clonar y modificar repositorios entre otras. De igual
modo, incluye comandos para revisar, modificar y crear _issues_ y manejar otras herramientas
de _GitHub_. Pueden consultar la página oficial aquí [GitHub CLI](https://cli.github.com/), donde
también encontrarán las instrucciones de instalación en distintos sistemas operativos y 
configuración de la herramienta.


## Algunos comandos útiles.

1. Crear un repositorio nuevo.

   ```
   gh repo create UBMI-IFC/test_tf_cpu_gpu \
      -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" \
	  --private --clone -g Python -l gpl-3.0
   ```
   
   - `-d` descripción del repositorio.
   - `--private` crear el repositorio cómo privado. Alternativamente se puede usar la 
     opción `--public`.
   - `--clone` clonar el repositorio en la carpeta actual.
   - `-g` especificar un templete de archivo *gitignore*
     [lista de templetes](https://github.com/github/gitignore).
   - `-l` especificar licencia. Esta opción es un poco engañosa. No es fácil encontrar
     el nombre específico de cada licencia. Algunos ejemplos son **gpl-3.0**, **gpl-2.0**,
	 **lgpl-3.0**, **mit**. [Aquí](https://github.com/github/choosealicense.com/tree/gh-pages/_licenses) se pueden encontrar algunas licencias. *Aparentemente* el nombre de la licencia 
	 aceptada por `gh` es el nombre de los archivos en el *link* (sin la extensión `.txt`).
   


2. Enlistar los repositorios de tu usuario u organización.

   ```
   gh repo list
   ```
   
   ```
   gh repo list UBMI-IFC
   ```

3. Clonar un repositorio preexistente.

   ```
   gh repo clone UBMI-IFC/Tutoriales-UFC
   ```
   
4. Crear un nuevo _issue_. Debes estar en la carpeta del repositorio en el que quieres crear
   el repositorio.
   
   ```
   gh issue create --label "help wanted" --assignee "cperalta22" --title "Add license" \
    --body "Please add a license, it may be bGPLv3, GPLlv3 or MIT"
   ```
   
   - `--label` etiqueta del *issue*.
   - `--assignee` usuario al que se le asigna la solución del *issue*.
   - `--title` título del *issue*.
   - `--body` cuerpo del *issue*.
   
5. Visualizar los *issues* asignados a uno mismo.

   ```
   gh issue list --assignee "@me"
   ```

6. Navegar en la versión *web* del repositorio. Tienes que estar en la carpeta del repositorio que
   quieres visualizar.
   
   ```
   gh browse
   ```






