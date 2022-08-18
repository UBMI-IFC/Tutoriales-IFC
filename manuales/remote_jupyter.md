
![header](/Tutoriales-IFC/assets/header.png)







# Instrucciones para conectarte remotamente con Jupyter

1. Primero debes configura la contraseña de jupyter en el servidor remoto.

```
$ jupyter notebook password
```

Esta contraseña es independiente de la contraseña de tu usuario y la puedes cambiar cuando
gustes usando el mismo comando.

2. Ahora puedes ejecutar jupyter especificando un puerto al cual te puedes conectar.

```
$ jupyter --no-browser --port=9090
```

Una vez que el servicio de jupyter esta corriendo, debes dejarlo así por el tiempo que estés trabajando.
Puedes usar byobu para mantener activo el notebook, __pero es recomendable apagar el servidor cuando no lo 
estés utilizando__.

3. Ahora, es necesario crear un tunel con SSH desde la computadora local que se usara para conectarse al servidor remoto.

Este ejemplo para conecrate a UBMI01 (10.10.180.79) desde otra computadora dentro del IFC. Se está creando un
puente del localhost en el servidor remoto al localhost en tu computadora local. El primer número 9090 corresponde
al puerto en la computadora local y el segundo corresponde puerto en la computadora remota (el que se configuró
en el paso anterior). Cambia <user> por tu nombre de usuario en la computadora remota.

```
$ ssh -L 9090:localhost:9090 <user>@10.10.180.79
```

4. Abrir jupyter desde tu explorador de internet.

La sesión de SSH abierta implica que el tunel está abierto. Ahora puedes abrir tu explorador de internet
favorito y escibir en la barra de dirección: _localhost:9090_

Listo!!! solo falta poner tu contraseña y usar Jupyter de forma normal

Recuerda cerrar tu conexión SSH y tu proceso de jupyter cuando termines de usarlo.

5. La conexión se puee hacer desde afuera del IFC usando UBMIportal

```
$ ssh -p <UBMIportal port> -L 9090:localhost:9090 <user>@<UBMIportal IP>  -t \
      "ssh -L 9090:localhost:9090 <user>@10.10.180.79"
```






