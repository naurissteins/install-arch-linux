#!/bin/bash
# KDE Plasma Desktop Environment

sudo pacman -S --noconfirm xorg sddm plasma kde-applications materia-kde

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
