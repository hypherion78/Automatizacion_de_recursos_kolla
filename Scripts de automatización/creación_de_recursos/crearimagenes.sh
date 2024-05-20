#!/bin/bash

set -ex

# Creación de las imagenes para OpenStack.
# Cirros
echo "----------------------"
echo "Comenzamos con cirros"
echo "----------------------"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/cirros-0.6.2-x86_64-disk.img \
   --progress \
   cirros

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   cirros

# Ubuntu 18-04
echo "----------------------"
echo "Comenzamos con ubuntu 18"
echo "----------------------"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/bionic-server-cloudimg-amd64.img \
   --progress \
   ubuntu-18

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   ubuntu-18

# Ubuntu 20.04
echo "----------------------"
echo "Comenzamos con ubuntu 20"
echo "----------------------"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/focal-server-cloudimg-amd64.img \
   --progress \
   ubuntu-20.04

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   ubuntu-20.04

# Debian 10
echo "----------------------"
echo "Comenzamos con debian 10"
echo "----------------------"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/debian-10-openstack-amd64.qcow2 \
   --progress \
   debian-10

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   debian-10

# FREE BSD
echo "----------------------"
echo "Comenzamos con freebsd"
echo "----------------------"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/freebsd-14.0-zfs-2024-05-06.qcow2 \
   --progress \
   freebsd-14

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   freebsd-14


# Fedora 40
echo "Comenzamos con fedora 40"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2 \
   --progress \
   fedora-40

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   fedora-40


# OpenSuse 15.2
echo "Comenzamos con opensuse 15.2"

# Creamos la imagen.
openstack image create \
   --container-format bare \
   --disk-format qcow2 \
   --file  ~/imagenes_cloud/openSUSE-Leap-15.2-OpenStack.x86_64.qcow2 \
   --progress \
   opensuse-15-2

# La establecemos como pública y protegida.
openstack image set \
   --public \
   --protected \
   opensuse-15-2