#!/bin/bash

# Set Local time (ls /usr/share/zoneinfo)
timedatectl set-timezone Europe/Riga
timedatectl set-ntp true

# Uncomment US and LV UTF-8 language
sed -i '177s/.//' /etc/locale.gen
sed -i '332s/.//' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts

# Change root password to archlinux (please change it later)
echo root:archlinux | chpasswd

# Install packages. Default AMD CPU
pacman -S --noconfirm grub xorg efibootmgr efivar networkmanager linux-headers base base-devel network-manager-applet dialog wpa_supplicant mtools dosfstools reflector avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils alsa-utils pulseaudio bash-completion openssh rsync reflector virt-manager qemu qemu-arch-extra ovmf bridge-utils

###### CPU #####
# AMD
# pacman -S amd-ucode

# Intel
# pacman -S intel ucode

##### GPU #####
# AMD
# pacman -S --noconfirm xf86-video-amdgpu mesa vulkan-radeon

# Nvidia
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings mesa

###### Laptop #####
# Battery saveing
# pacman -S acpi acpi_call tlp
