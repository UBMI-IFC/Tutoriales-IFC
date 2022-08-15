Con autowebmaster se parsea la estructura de directorios del repositorio de tutoriales actualizando los contenidos de la página de tutoriales de manera casi automática

    1. La página principal se construye en el README.md en el directorio root

    2. Las páginas de las categoria se contruyen a partir de cada carpeta (a excepción de "web") del directorio root, DEBE haber un archivo markdown que se llame IGUAL que la carpeta que lo contiene, este será la descripción e indice de la misma.
	
	3. En la carpeta "web" están las descripciones generales de cada categoria de manera que si se quiere personalizar la página de las categorías se tomará de esos documentos.


Requerimientos:

	tree
