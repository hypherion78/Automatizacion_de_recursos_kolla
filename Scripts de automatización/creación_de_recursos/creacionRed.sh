#!/bin/bash

set -ex

# Creación de las redes.
# Red externa

# Se crea la red externa para asignarla al router,  y dar conectividad a internet a las instancias.

openstack network create \
  --external \
  --provider-physical-network physnet1 \
  --provider-network-type flat \
  --enable \
  --description "Red-Externa-equipos" \
  red-externa-equipos

# Creamos la subred para la red externa. Se asignará a la red externa en el router  Cuando se configure con "openstack router set"
openstack subnet create \
  --network red-externa-equipos \
  --dns-nameserver 192.168.22.100 \
  --gateway 192.168.22.100 \
  --subnet-range 192.168.22.0/24 \
  --description "Subred-Externa-Equipos" \
  subred-externa-equipos

# Creamos el router para asignar las redes y subredes al router
openstack router create \
    --project admin \
   principal-router

# Permitimos la conectividad de la red privada con el exterior.
openstack router set \
    --external-gateway red-externa-equipos \
    principal-router
