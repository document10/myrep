#!/bin/bash
#must run as root
pacman -Syu
pacman -S xorg xorg-server xterm firefox lightdm  lightdm-gtk-greeter lightdm-gtk-greeter-settings archlinux-wallpaper pcmanfm avahi xdg-user-dirs xdg-utils gedit bluez bluez-utils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack sof-firmware blueman arc-solid-gtk-theme arc-gtk-theme arc-icon-theme openbox obconf tint2 picom lxappearance xarchiver unzip gzip lzip menumaker volumeicon mousepad xfce4-terminal polkit-gnome
mmaker openbox -f -t xfterm
systemctl enable lightdm
systemctl enable bluetooth
echo "mmaker openbox -f -t xfterm &" >> /home/doc10/.xprofile
echo "openbox --reconfigure &" >> /home/doc10/.xprofile
echo "compton -f &" >> /home/doc10/.xprofile
echo "tint2 &" >> /home/doc10/.xprofile
echo "pcmanfm -d --desktop &" >> /home/doc10/.xprofile
echo "volumeicon &" >> /home/doc10/.xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" >> /home/doc10/.xprofile
echo "nm-applet &" >> /home/doc10/.xprofile
