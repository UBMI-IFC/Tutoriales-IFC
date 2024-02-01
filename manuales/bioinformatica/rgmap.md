
![header](/Tutoriales-IFC/assets/header.png)

# Instalación de rGMAP

`rGMAP' es un programa útil para calcular **TDAs** y **sub TADs** en experimentos de **HiC**.

El programa se puede encontrar en [https://github.com/wbaopaul/rGMAP](https://github.com/wbaopaul/rGMAP)

Para instalarlo en un ambiente virtual de conda:

1. Descargar el código fuente comprimido del repositorio de GitHub.

2. Crear el ambiente virtual con la versión adecuada de `R` (puedes usar `conda` si no tienes instalado `mamba`).

```bash
mamba create -n rgmap-env -c conda-forge r=3.5.1 r-devtools r-data.table r-mclust emd r-ggplot2 r-catools r-locfit
```

El paquete `r-locfit` es dependencia del paquete `EMD`

3. Instalar `EMD` desde `R`

```bash
# En Bash
conda activate rgmap-env
R
```


```R
# En R
install.packages('EMD')
install.packages('path to rGMAP_1.4.tar.gz', type='source', rep=NULL)
```




## Ejemplo, Instalarlo con mamba en un ambiente diferente al base
mamba create -p /home/anaconda/Anaconda3/envs/rgmap-env -c conda-forge r=3.5.1 r-devtools r-data.table r-mclust emd r-ggplot2 r-catools r-locfit

## Ejemplo, instalando paquetes adicionales de R.

mamba create -n rgmap-env -c conda-forge r=3.5.1 r-devtools r-data.table r-mclust emd r-ggplot2 r-catools r-locfit r-dplyr r-pkgdown r-ragg r-devtools r-tidyr r-rcpp 

![header](/Tutoriales-IFC/assets/header.png)

