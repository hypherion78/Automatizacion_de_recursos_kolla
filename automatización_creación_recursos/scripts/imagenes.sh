/bin/bash

set -ex

# Comando para crear el entorno virtual.
source ~/virtual/bin/activate

# Comando para establecer las credenciales.
source /etc/kolla/admin-openrc.sh

wget https://download.cirros-cloud.net/0.6.2/cirros-0.6.2-x86_64-disk.img -P /tmp

openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file cirros-0.6.2-x86_64-disk.img \
   --progress \
   cirros

openstack image set \
   --public \
   --protected \
   cirros
