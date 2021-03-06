#!/bin/bash

vm_guest_name="vm-test"
image="/var/lib/libvirt/images/bionic-base-amd64.qcow2"
$src_image="https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"

curl -o $image $src_image

virt-install -n $vm_guest_name -r 1024 --vcpus=1 \
    --disk path=$image,size=16 \
    --vnc --noautoconsole --os-type linux --os-variant ubuntu18.04 --import
