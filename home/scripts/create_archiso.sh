#!/bin/sh

rm -r ~/archiso
rm -r ~/Dropbox/Isos/archlinux-*.iso
sudo rm -r /tmp/archiso-tmp

mkdir ~/archiso
cp -r /usr/share/archiso/configs/releng ~/archiso &&

mkdir ~/archiso/releng/airootfs/etc/default &&
cp -r /etc/default/grub ~/archiso/releng/airootfs/etc/default &&

mkdir -p ~/archiso/releng/airootfs/etc/systemd/system/multi-user.target.wants &&

echo "[Unit]
Description=Network Manager
Documentation=man:NetworkManager(8)
Wants=network.target
After=network-pre.target dbus.service
Before=network.target
BindsTo=dbus.service

[Service]
Type=dbus
BusName=org.freedesktop.NetworkManager
ExecReload=/usr/bin/busctl call org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.NetworkManager Reload u 0
#ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/bin/NetworkManager --no-daemon
Restart=on-failure
# NM doesn't want systemd to kill its children for it
KillMode=process

# With a huge number of interfaces, starting can take a long time.
TimeoutStartSec=600

# CAP_DAC_OVERRIDE: required to open /run/openvswitch/db.sock socket.
CapabilityBoundingSet=CAP_NET_ADMIN CAP_DAC_OVERRIDE CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_MODULE CAP_AUDIT_WRITE CAP_KILL CAP_SYS_CHROOT

ProtectSystem=true
ProtectHome=read-only

# We require file descriptors for DHCP etc. When activating many interfaces,
# the default limit of 1024 is easily reached.
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
Also=NetworkManager-dispatcher.service

# We want to enable NetworkManager-wait-online.service whenever this service
# is enabled. NetworkManager-wait-online.service has
# WantedBy=network-online.target, so enabling it only has an effect if
# network-online.target itself is enabled or pulled in by some other unit.
Also=NetworkManager-wait-online.service
" > ~/archiso/releng/airootfs/etc/systemd/system/multi-user.target.wants/NetworkManager.service &&


sudo mkarchiso -v -o ~/Dropbox/isos -w /tmp/archiso-tmp ~/archiso/releng
echo "dd if=~/Dropbox/isos/arch... of=/dev/sdX bs=4M status=progress"
echo "copy .ssh and /Script/arch_post_install.sh to the drive"
