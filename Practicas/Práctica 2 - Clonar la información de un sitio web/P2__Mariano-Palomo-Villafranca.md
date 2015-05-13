Práctica 2: Clonar la información de un sitio web
==========
*Mariano Palomo Villafranca*

> En esta práctica el objetivo es configurar las máquinas virtuales para trabajar en modo espejo, consiguiendo que una máquina secundaria mantenga siempre actualizada la información que hay en la máquina servidora principal.

###Ejercicio 1: Probar el funcionamiento de la copia de archivos por ssh
Para ello, introducimos en la máquina donde se encuentra el directorio que queremos copiar, por ejemplo *swap1415/*, el siguiente comando: 
	
	ssh czf - swap1415/ | ssh mpvillafranca@192.168.10.102 'cat > ~/tar.tgz'

Comprobamos que efectivamente se realiza la copia y no hay ningún problema en la conexión.

###Ejercicio 2: Clonado de una carpeta entre las dos máquinas
Ahora, mediante *rsync*, dentro de la máquina 2, copiaremos el contenido de `/var/www/` utilizando el comando: 

	rsync -avz -e ssh root@192.168.10.101:/var/www/ /var/www/

Si accedemos a la máquina 1, comprobamos que el contenido ha sido clonado correctamente.

###Ejercicio 3: Configuración de ssh para acceder sin contraseña
En nuestra máquina 2, ejecutamos `ssh-keygen -t dsa`, sin indicar ninguna passphrase para generar nuestra clave. A continuación, realizamos:

	ssh-copy-id -i $HOME/.ssh/id_dsa.pub root@192.168.10.101
	
Con esto, hemos transferido nuestra clave pública y ya podemos acceder a la máquina 1, con IP 192.168.10.101, sin necesidad de tener que introducir la contraseña.

###Ejercicio 4: Establecer una tarea en cron que se ejecute cada hora para mantener actualizado el contenido del directorio /var/www entre las dos máquinas
Para ello, accedemos dentro de la segunda máquina al fichero `/etc/crontab`. Aquí añadimos la siguiente línea: 

	0 * * * * rsync -avz -e ssh root@192.168.10.101:/var/www/ /var/www/

Con el primer campo a 0 indicamos que se realize en el minuto 0 y con los demás campos en * indicamos que se realize a cualquier hora, cualquier día de cualquier mes de cualquier dia de la semana, es decir, se ejecutará, en definitiva, cada hora.

##Problemas encontrados y solución
* **Acceder como root a la máquina por SSH**: para que la máquina nos permita acceder por SSH como root, debemos acceder al fichero `/etc/ssh/sshd_config` y modificar el parámetro `PermitRootLogin yes`. Por último, ejecutamos `service ssh restart`.