#!/bin/bash

# Mostrar lo que realiza el comando.
set -ex

for borrarImagen in $(openstack image list --format=value -c ID); do
    openstack image set --unprotected $borrarImagen
    openstack image delete $borrarImagen 
done

