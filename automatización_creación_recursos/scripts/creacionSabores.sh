# Establecer el interprete de comandos.
#!/bin/bash

# Mostrar lo que realiza el comando.
set -ex

# Creación de los sabores.
openstack flavor create m1.nano \
  --ram 128 \
  --disk 10 \
  --vcpus 1 \
  --id 1

openstack flavor create m1.micro \
  --ram 256 \
  --disk 10 \
  --vcpus 1 \
  --id 2

openstack flavor create m1.mini \
  --ram 512 \
  --disk 10 \
  --vcpus 1 \
  --id 3

openstack flavor create m1.normal \
  --ram 1024 \
  --disk 10 \
  --vcpus 2 \
  --id 4

openstack flavor create m1.medium \
  --ram 2048 \
  --disk 10 \
  --vcpus 2 \
  --id 5

openstack flavor create m1.large \
  --ram 4096 \
  --disk 20 \
  --vcpus 4 \
  --id 6

openstack flavor create m1.xlarge \
  --ram 8192 \
  --disk 20 \
  --vcpus 4 \
  --id 7