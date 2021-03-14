#!/bin/bash

# Set Local time (ls /usr/share/zoneinfo)
timedatectl set-timezone Europe/Riga
timedatectl set-ntp true

# Uncomment US and LV UTF-8 language
sed -i '177s/.//' /etc/locale.gen
sed -i '332s/.//' /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

locale-gen

echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts

# Change root password to archlinux (default password: archlinux) - CHANGE IT LATER!
echo root:archlinux | chpasswd

# Install packages. Default AMD CPU
pacman -S --noconfirm grub efibootmgr efivar networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils dnsutils bluez bluez-utils alsa-utils pulseaudio rsync virt-manager qemu qemu-arch-extra ovmf bridge-utils

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd

# Add user and set password (default password user: arch, password: arch)
useradd -m arch
echo arch:arch | chpasswd
usermod -aG libvirt arch
echo "arch ALL=(ALL) ALL" >> /etc/sudoers.d/arch


/bin/echo -e "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
