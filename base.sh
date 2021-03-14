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
pacman -S --noconfirm grub xorg efibootmgr efivar networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils dnsutils bluez bluez-utils alsa-utils pulseaudio penssh rsync virt-manager qemu qemu-arch-extra ovmf bridge-utils


###### CPU #####
# AMD
# pacman -S amd-ucode

# Intel
# pacman -S intel-ucode inetutils

##### GPU #####
# AMD
# pacman -S --noconfirm xf86-video-amdgpu mesa vulkan-radeon

# Nvidia
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings mesa

###### Laptop #####
# Battery saveing
# pacman -S acpi acpi_call tlp

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd

useradd -m arch
echo arch:arch | chpasswd
usermod -aG libvirt arch

echo "arch ALL=(ALL) ALL" >> /etc/sudoers.d/arch

/bin/echo -e "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
