
![header](/Tutoriales-IFC/assets/header.png)

# LigandMPNN

## Instrucciones de instalación y uso

### Uso por primera vez

La __PRIMERA VEZ__ que quieras utilizar este programa requerirás tomar la siguientes acciones

- Estando conectado a _pdesign_ descarga el repositorio de LigandMPNN.
    ```bash
    git clone https://github.com/dauparas/LigandMPNN.git
    ```
- Activa el ambiente virtual
    ```bash
    conda activate ligandmpnn_env
    ```
- Cámbiate al directorio del repositorio, por ejemplo:
    ```bash
    cd /path/al/repositorio/LigandMPNN
    ```
- Ejecuta la siguiente línea de código:
    ```bash
    bash get_model_params.sh "./model_params"
    ```
- Una vez completado este paso ejectuta el script de prueba para asegurarte del buen funcionamiento del programa:
    ```bash
    bash run_examples.sh
    ```

### Uso subsecuente

Por la forma en que está escrito este programa __se espera que el usuario lo ejecute estando dentro del directorio del repositorio__

- Activa el ambiente virtual
    ```bash
    conda activate ligandmpnn_env
    ```
- Cámbiate al directorio del repositorio, por ejemplo:
    ```bash
    cd /path/al/repositorio/LigandMPNN
    ```
- Ejecuta el programa con los parámetros que deseés:
    ```bash
    python run.py {Aqui van todos tus parámetros, los corchetes {} no se escriben} 
    ```

Encuentra la documentación completa del uso de este programa en su [página](https://github.com/dauparas/LigandMPNN) de github

![header](/Tutoriales-IFC/assets/header.png)

