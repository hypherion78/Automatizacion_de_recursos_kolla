#!/bin/bash

# Establecemos la siguiente sentencia, para que si hay un error que continue el script.
set -ex

# Establecemos el fichero con csv
INPUT_CSV_FILE=usuarios.csv


# Creamos los usuarios.
while IFS=';' read -r USER FULLNAME EMAIL DOMAIN
do
  # Mostramos los valores de cada columna
echo ${USER}
echo ${FULLNAME}
echo ${EMAIL}
echo ${DOMAIN}

# Creamos el usuario.
openstack user create \
    --domain default \
    --email $EMAIL \
    --description "Es el usuario $USER CON $FULLNAME" \
    --enable \
    $USER

 # Creamos un proyecto
openstack project create \
    --domain default \
    --description "Proyecto de $USER" \
    --enable \
    $USER # DEFINE EL NOMBRE DEL PROYECTO

# Establecemos una contraseña a un usuario y lo asignamos al proyecto.
openstack user set \
   --password $USER \
   --project $USER $USER

# Establecer cuota sobre proyectos de usuarios
openstack quota set \
  --ram 5000\
  --cores 10 \
  --networks 10 \
  --ports 50 \
  --routers 10 \
  --secgroups 10 \
  --secgroup-rules 15 \
  --floating-ips 3 \
  --volumes 1 \
  --snapshots 2 \
  --gigabytes 10 \
  $USER
# Creación de los grupos de seguridad.
openstack security group create \
  --description "Grupo de seguridad para $USER" \
  --project $USER \
  $USER

# Añadimos reglas de seguridad a la regla previamente creada.
openstack security group rule create \
  --protocol tcp \
  --remote-ip 0.0.0.0/0 \
  --dst-port 22 \
  $USER

openstack security group rule create \
  --proto tcp --dst-port 80 \
  $USER

openstack security group rule create \
  --proto tcp --dst-port 443 \
  $USER
  
openstack security group rule create \
  --protocol icmp \
  $USER

#ASOCIA EL USUARIO AL PROYECTO
# Creación de los roles para el nuevo usuario.  Preguntar a Jose Juan.
openstack role create $USER

# Asignamos el rol al usuario
openstack role add \
    --user $USER --project $USER \
    member

# No me deja hacer nada hasta que no añada el usuario miembro en el proyecto

# Creación de la red
#Red Interna
openstack network create \
  --enable \
  --description "Red interna" \
  --project $USER \
  red-interna-$USER

# Creación de la subred
openstack subnet create \
  --project $USER \
  --network red-interna-$USER \
  --subnet-range 10.0.0.0/24 \
  --dns-nameserver 192.168.22.100 \
  subred-interna-$USER

openstack router create \
  --project $USER \
  router-$USER

openstack router add subnet \
    router-$USER \
    subred-interna-$USER

openstack router set \
    --external-gateway red-externa-equipos \
    router-$USER

done < <(tail -n +2 ${INPUT_CSV_FILE}) 

# Si funciona aunque se asignen ips flotantes y volumenes.
