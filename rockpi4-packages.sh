#!/bin/sh
cp /etc/THIRD_BOOT /etc/FOURTH_BOOT
rm -f /etc/THIRD_BOOT

rm -rf /var/cache/apt/archives
apt-get update
apt-get -y upgrade
apt -y dist-upgrade
# rockpi4 essential packages
apt-get install -y rockchip-fstab
apt-get install -y rockpi4-dtbo
apt-get install -y rockchip-overlay
# rockpi4 latest kernel and bootloader
apt-get install -y linux-base
apt-get install -y linux-4.4-latest
apt-get install -y rockpi4b-rk-u-boot-latest
# additional HW componentes (Power over Ethernet)
apt-get install -y rockpi4-poe libmraa-rockpi4 
# rockpi4 - optional
apt-get install -y rockchip-mpp-demos
apt-get install -y linux-libc-dev opencv4.0
# rockpi4 - optional - Video and GPU
apt-get install -y librockchip-mpp1 librockchip-mpp-static librockchip-mpp-dev librockchip-vpu0
apt-get install -y gstreamer1.0-rockchip1 gstreamer1.0-rockchip1-extra
## bluetooth
apt-get install -y bluez ap6256-firmware
apt-get install -y brcm-patchram-plus1-64
# optional - misc
apt-get install -y rkflashtool
apt-get install -y 96boards-tools-common
# optional install openssh server/client
apt-get install -y openssh-server openssh-client openssh-sftp-server

# optional install git, terminal file browser/texteditor/alternative downloader
apt-get install -y git mc nano xz-utils curl

