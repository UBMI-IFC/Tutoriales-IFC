
![header](/Tutoriales-IFC/assets/header.png)






# Manejar passwords.

## Verificar datos de *password* de un usuario.

```bash
chage -l [user]
```

## Expirar un *password*. 

... y forzar al usuario a introducir un password nuevo en el próximo *login*. Se puede especificar usando lso comandos `passwd` y `chage`.

```bash
passwd -e [user]
```

```bash
chage --lastday 0 [user]
```

## Borrar *password* de un usuario.
Este comando borra el password de un usuario. De modo que puede **ENTRAR
SIN CONTRASEÑA**.

```bash
passwd -d [user]
```

## Poner fecha de expiració de un *password*.

```bash
chage -E YYYY-MM-DD [user]
```


## Hacer que la cuenta caduque si no se actualiza la contraseña.

## 





![header](/Tutoriales-IFC/assets/header.png)

