#!/usr/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Must run as root,exiting..."
  exit
fi
xbps-install -Syuv
xbps-install liblz4 -y qemu-user-static git
git clone https://github.com/void-linux/void-mklive
cd void-mklive
./mklive.sh -p 'grub-i386-efi grub-x86_64-efi efibootmgr firefox fuse exfat-utils xorg xdg-user-dirs xdg-utils xinit xorg-input-drivers xorg-video-drivers git setxkbmap xauth font-misc-misc terminus-font dejavu-fonts-ttf exa micro neofetch alacritty pcmanfm xbps dialog cryptsetup lvm2 mdadm void-docs-browse xtools-minimal xmirror xterm xclock twm network-manager-applet polkit avahi' -S "dhcpcd wpa_supplicant acpid dbus NetworkManager polkitd avahi-daemon" -C "live.autologin"
