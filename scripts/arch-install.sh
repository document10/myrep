#!/bin/bash
echo "Configuring locales"
ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime
hwclock --systohc --utc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
locale-gen
echo "Configuring network"
echo "archmc" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archmc.localdomain archmc" >> /etc/hosts
cat /etc/hosts
echo "Root password:"
passwd root
echo "Installing base packages"
pacman -Syu --noconfirm linux-firmware git neofetch networkmanager reflector base-devel linux-headers ipset os-prober ntfs-3g terminus-font openssh bash-completion dnsutils ufw iptables micro exa ed gd lldb gdb crda ipcalc strace iwd lsof htop db efibootmgr grub

echo "Configuring grub bootloader (efi)" 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "Configuring base services"
systemctl enable --now NetworkManager
systemctl enable --now iwd
systemctl enable --now sshd
echo "Configuring firewall"
systemctl enable --now iptables
systemctl enable --now ip6tables
systemctl enable --now ufw
ufw enable
ufw allow ssh
ufw status

echo "Creating a new user"
useradd -m dxvk
echo "Password for dxvk:"
passwd dxvk
echo "dxvk ALL=(ALL) ALL" >> /etc/sudoers.d/dxvk
usermod -aG wheel,audio,video,optical,storage dxvk
echo "dxvk now has sudo privilleges."

echo "Final configuration"
mkinitcpio -P
echo "Installation complete."
