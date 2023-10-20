
![header](/Tutoriales-IFC/assets/header.png)










# RStudio server con conda/anaconda/SEISbio.

RStudio es el principal IDE para programar en R. Sin embargo, puede ser problemática su instalación
y uso en ambientes multiusuario o con ambientes virtuales. Por esta razón, puede ser buena idea
usar RStudio-server para su uso en servidores de análisis.

Algunas instrucciones para usar RStudio-server y usar una isntalación de R contenida en algún
ambiente virtual:

> **Advertencia** Esta instalación no perimite instalar paquetes con install.packages
> por que Rstudio-server no carga el ambiente de anaconda antes de ejecutar el interprete
> de R. Si quieres usar una instalación de R completamente funcional, es más conveniente
> instalar R en el sistema operativo.


1. Instalar RStudio-server como se indica en la página web: https://posit.co/download/rstudio-server/

2. Configura RStudio-server para usar una instalación de R contenida en algún ambiente virtual.
  Para esto, es necesario modificar el archivo `/etc/rstudio/rserver.conf` agregando la siguiente
  linea: `rsession-which-r=[path for virtual env]/bin/R`

3. Reiniciar el servidor de RStudio









![header](/Tutoriales-IFC/assets/header.png)

