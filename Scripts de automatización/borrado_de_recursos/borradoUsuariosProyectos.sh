#!/bin/bash

# Establecemos la siguiente sentencia, para que si hay un error que continue el script.
set -ex

# Añadimos las variables
source .env


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

# 1º Eliminamos la información de la puerta de enlace del router del usuario.
openstack router unset --external-gateway router-$USER

# 2º Eliminamos los puertos asociados al router.
for PORT in $(openstack port list --router router-$USER --format=value -c ID);
do
    openstack router remove port router-$USER $PORT
done

# 3º Eliminamos el router
openstack router delete router-$USER

# 4º Borramos la subred del proyecto $USER
openstack subnet delete subred-interna-$USER

# 5º Borramos la red de la red interna.
openstack network delete red-interna-$USER

# 6º Borramos el grupo de seguridad.
openstack security group delete $USER

# Borramos el rol del proyecto para los permisos de usuarios.
openstack role delete $USER

# Borramos al usuario.
openstack user delete $USER 

# Borrado del proyecto
openstack project delete $USER


done < <(tail -n +2 ${INPUT_CSV_FILE}) 