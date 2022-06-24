
# Instalación de HiGlass

0. instalar Docker
   a. el usuario que corre higlass debe estar en el grupo docker
   b. Descargar el contenedor
   ```bash
   sudo docker pull higlass/higlass-docker
   ```
1. crear ambiente virtual solo con python
2. activar el ambiente
3. instalar con pip 
   - higlass-manage
   - higlass-python
   - higlass_jupyter
   - higlass-schema
   - higlass-widget
4. Iniciar HiGlass
   ```bash
   higlass-manage start
   ```
5. Ingerir datos
   ```bash
   higlass-manage ingest <datos>
   ```
6. Acceder al servidor con el puerto especificado (8989 default)

