#!/usr/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Must run as root,exiting..."
  exit
fi
xbps-install -Syuv
xbps-install liblz4 qemu-user-static
git clone https://github.com/void-linux/void-mklive
cd void-mklive
mkdir -p temp/usr/bin
cp installer.sh temp/usr/bin/void-installer
./mklive.sh -p 'xorg xdg-user-dirs xdg-utils xinit gvfs xorg-input-drivers xorg-video-drivers setxkbmap xauth font-misc-misc terminus-font dejavu-fonts-ttf orca exa micro neofetch alacritty xbps octoxbps sddm mate mate-extra dialog cryptsetup lvm2 mdadm void-docs-browse xtools-minimal xmirror xterm xclock twm pipewire wireplumber bluez blueman network-manager-applet polkit avahi polkit-gnome' -S "dhcpcd wpa_supplicant acpid dbus sddm NetworkManager polkitd avahi-daemon bluetoothd" -I temp -C "live.autologin" -T "Void Linux (MATE)" -o "void-linux-mate.iso"
