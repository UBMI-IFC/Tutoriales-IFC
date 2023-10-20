
![header](/Tutoriales-IFC/assets/header.png)


# Create an Orange Conda environment to explore single cell data.

- This guide is only to list Orange required dependencies and its installation commands. For information on how to install Anaconda (Miniconda3) check this [link](https://docs.conda.io/projects/miniconda/en/latest/miniconda-install.html).

- On a anaconda console (regular console if using Linux or MacOS) create an enviroment to install Orange.

```bash
conda create -n orange-env -c bioconda -c conda-forge
```
- Now activate your newly created environment by executing:


```bash
conda activate orange-env 
```
- Then install the appropiate packages

```bash
conda install orange-canvas-core orange-widget-base orange3 orange3-bioinformatics orange3-singlecell
```
- Finally run Orange by executing:


```bash
orange-canvas
```

![header](/Tutoriales-IFC/assets/header.png)

