#!/bin/bash

# Mostrar lo que realiza el comando.
set -ex

# Borrado de los sabores.
for borrarSabores in $(openstack flavor list --format=value -c Name); 
do
    openstack flavor delete $borrarSabores
done