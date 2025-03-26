
![header](/Tutoriales-IFC/assets/header.png)

# ProteinMPNN

>
> [TODO] <span style="color:red">**IMPORTANTE**</span> en la instalación actual,en eso mas adelante.
> el programa no está usando el **GPU**.  
>

<span style="color:blue">some *blue* text</span>

## Archivos.
Los archivos del programa se descargaron del [repositorio de GitHub](https://github.com/dauparas/ProteinMPNN) en 
`/home/acph/ProteinMPNN`. En ese *path* se encuentran todos los *scripts* y ejemplos del programa. 

## Uso.

### Uso en la línea de comandos.

Todos los *scripts* de este repositorio se ejecutan directamente con Python. Sin embargo, hicimos algunas modificaciones
para facilitar su ejecución.
De este modo se crearon accesos directos para los _scritps_ principales `protein_mpnn_run.py`, `protein_mpnn_run.py` y
todos los _scritps_ de la carpeta `helper_scripts`.

Para usar los programas hay que hacer los siguiente:

1. Activar el ambiente virtual:

```bash
(base)$ conda activate mlfold
```

2. Llamar por nombre el *script* deseado:
```bash
# por ejemplo para ver la ayuda
(mlfold)$ protein_mpnn_run.py
```

3. Dejar de trabajar en el ambiente virtual:
```bash
(mlfold)$ conda deactivate
```

### Uso desde un *script*.

En el repositorio de ProteinMPNN hay una carpeta con ejemplos (`examples`) en forma de *scripts* de `bash`.
Los ejemplos mostrados aquí funcionan cómo si estuvieras trabajando directamente en el repositorio pero no se
pueden usar igual en nuestra instalación.

Para esto, mostramos aquí dos modificaciones del ejemplo 1 (`submit_example_1.sh`). Ambas opciones
funcionan bien y se puede usar cualquiera.

#### Llamando el ambiente virtual desde el *script* y usando los programas por nombre.

Este *script* (`submit_example_1_activating.sh`) sustituye al original. La parte más importante a considerar es la
sección "Preparación del script". Son un conjunto de líneas de código que permiten ejecutar los programas. 

```bash
#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH --gres=gpu:rtx2080:1
#SBATCH -c 2
#SBATCH --output=example_1.out

# -- Preparación del script
# Permite usar aliases en el script
shopt -s expand_aliases
# activa conda
eval "$(conda shell.bash hook)"
# activa el ambiete virtual
conda activate mlfold
# --

# Path completo de los archivos de entrada
folder_with_pdbs="/home/seisbio/repos/ProteinMPNN/inputs/PDB_monomers/pdbs/"

output_dir="./outputs/example_1_outputs"
if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

path_for_parsed_chains=$output_dir"/parsed_pdbs.jsonl"

parse_multiple_chains.py --input_path=$folder_with_pdbs --output_path=$path_for_parsed_chains

protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --out_folder $output_dir \
        --num_seq_per_target 2 \
        --sampling_temp "0.1" \
        --seed 37 \
        --batch_size 1
```

El _script_ se ejecuta así:

```bash
(base)$ bash submit_example_1_activating.sh
```

#### Llamando el ambiente virtual desde el *script* y usando los programas por nombre.

Primero es necesario activar el ambiente virtual. 

```bash
(base)$ conda activate ml-fold
```


Este *script* (`submit_example_1_modificado.sh`) sustituye al original.


```bash
#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH --gres=gpu:rtx2080:1
#SBATCH -c 2
#SBATCH --output=example_1.out

# Path completo de los archivos de entrada
folder_with_pdbs="/home/seisbio/repos/ProteinMPNN/inputs/PDB_monomers/pdbs/"

output_dir="./outputs/example_1_outputs"
if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

path_for_parsed_chains=$output_dir"/parsed_pdbs.jsonl"

# Ejecutar con python los scripts
# escribiendo el path completo
python /home/seisbio/repos/ProteinMPNN/helper_scripts/parse_multiple_chains.py --input_path=$folder_with_pdbs --output_path=$path_for_parsed_chains


python /home/seisbio/repos/ProteinMPNN/protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --out_folder $output_dir \
        --num_seq_per_target 2 \
        --sampling_temp "0.1" \
        --seed 37 \
        --batch_size 1
```


El _script_ se ejecuta así:

```bash
(mlfodl)$ bash submit_example_1_modificado.sh
```

![header](/Tutoriales-IFC/assets/header.png)

