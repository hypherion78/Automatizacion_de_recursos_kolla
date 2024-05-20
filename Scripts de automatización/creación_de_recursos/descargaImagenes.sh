#!/bin/bash

wget https://download.cirros-cloud.net/0.6.2/cirros-0.6.2-x86_64-disk.img -P /tmp
mv /tmp/cirros-0.6.2-x86_64-disk.img ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/bionic-server-cloudimg-amd64.img ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/focal-server-cloudimg-amd64.img ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget http://cdimage.debian.org/cdimage/openstack/current-10/debian-10-openstack-amd64.qcow2 -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/debian-10-openstack-amd64.qcow2 ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget https://object-storage.public.mtl1.vexxhost.net/swift/v1/1dbafeefbd4f4c80864414a441e72dd2/bsd-cloud-image.org/images/freebsd/14.0/2024-05-06/zfs/freebsd-14.0-zfs-2024-05-06.qcow2 -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/freebsd-14.0-zfs-2024-05-06.qcow2 ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2 -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2 ~/imagenes_cloud/

# Descarga del sistema operativo desde las nubes oficiales para openstack
wget https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.2/images/openSUSE-Leap-15.2-OpenStack.x86_64.qcow2 -P /tmp

# Movemos la imagen al directorio imagenes.
mv /tmp/openSUSE-Leap-15.2-OpenStack.x86_64.qcow2 ~/imagenes_cloud/