#!/bin/sh
unminimize
apt update
apt -y upgrade
apt -y dist-upgrade

# make Mate the default desktop environment for xrdp sessions (also for new users being created afterwards)
echo mate-session> /home/rock/.xsession
chown rock /home/rock/.xsession
cp /home/rock/.xsession /etc/skel
# mate desktop
apt-get install -y lightdm
DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-mate-desktop ubuntu-mate-core --no-install-recommends
apt-get install -y locales mate-desktop-environment mate-notification-daemon
locale-gen en_US.UTF-8
# install language support
apt-get install -y language-pack-en-base language-pack-en

apt-get install -y x11vnc xrdp
# allow changing the host post port we can connect to (this allows reconnecting to an abandoned session)
sed -i 's/port\=-1/port\=ask-1/' /etc/xrdp/xrdp.ini
service xrdp stop
systemctl enable xrdp
service xrdp start
# enable autologin
mkdir -p /etc/lightdm/lightdm.conf.d
touch /etc/lightdm/lightdm.conf.d/12-autologin.conf
echo "[SeatDefaults]" > /etc/lightdm/lightdm.conf.d/12-autologin.conf
echo "autologin-user=rock" >> /etc/lightdm/lightdm.conf.d/12-autologin.conf

/usr/bin/install-desktop-extras.sh
