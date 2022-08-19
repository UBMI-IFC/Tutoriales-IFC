
![header](/Tutoriales-IFC/assets/header.png)















# Instalación de HiGlass

0. Instalar Docker
   a. Instalación de la [documentación](https://docs.docker.com/engine/install/ubuntu/) de Docker.
   
   ```bash
   # actualizar el sistema
   sudo apt-get update && sudo apt-get upgrade
   # instalar programas necesarios, en general ya están instalados
   sudo apt-get install ca-certificates curl gnupg lsb-release
   # crear carpeta de llavero de apt, en general ya está disponible
   sudo mkdir -p /etc/apt/keyrings/
   # descargar y colocar llave gpg del repo de docker
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo \
      gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   # agregar repositorio de Docker a apt
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   # instalar programas de Docker
   sudo apt-ger update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   # probar instalación correcta de Docker
   sudo docker run hello-world
   ```

   b. El usuario que corre higlass debe estar en el grupo docker
   
   ```bash
   sudo usermod -a -G docker acph
   ```
      
   c. Descargar el contenedor
   
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






