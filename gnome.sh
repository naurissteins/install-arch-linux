#!/bin/bash
# Gnome Desktop Environment
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

sudo yay -S --noconfirm xorg gdm gnome gnome-extra gnome-tweaks chrome-gnome-shell arc-gtk-theme arc-icon-theme

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
