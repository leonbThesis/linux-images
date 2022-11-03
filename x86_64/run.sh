#!/bin/sh

ABSPATH=$(readlink -f "$0")
DIRPATH=$(dirname "$ABSPATH")
ROOTFS=$1
KERNEL=$DIRPATH/images/bzImage

qemu-system-x86_64 -L "/qemu/pc-bios" -m 2048 -M pc -kernel $KERNEL -drive file=$ROOTFS,if=virtio,format=raw -rtc base="2013-10-15",clock=vm  -append "root=/dev/vda console=ttyS0" -net nic,model=e1000,macaddr=54:2A:9C:93:44:B0 -net user -nographic
