#!/bin/bash

set -ex

# Cargamos las variables
#source .env

# Proceso para eliminar la red.
# 1º Obtenemos un listado de los routers asociados a 1 proyecto.
#openstack router list --project $NOMBRE_PROYECTO

# 2º Eliminamos la información de la puerta de enlace del router.
openstack router unset --external-gateway principal-router

# 3 Eliminamos los puertos asociados al router.
for PORT in $(openstack port list --router principal-router --format=value -c ID);
do
    openstack router remove port principal-router $PORT
done

# 4 Eliminamos el router:
openstack router delete principal-router

# 5 Eliminamos la subred
# Obtenemos listado de las subredes según el proyecto asociado.
#openstack subnet list --project $NOMBRE_PROYECTO

# Eliminamos la subred asociada al proyecto.
for SUBNET_ID in $(openstack subnet list --project admin --format=value -c ID);
do
    openstack subnet delete $SUBNET_ID
done

# Eliminamos las redes.

# Eliminamos las redes asociadas al proyecto.
for NET in $(openstack network list --project admin --format=value -c ID);
do
    openstack network delete $NET
done
