#!/bin/bash
# Use this script only if you running Arch Linux on laptop
# Battery saving
pacman -S --noconfirm acpi acpi_call tlp
systemctl enable acpid
systemctl enable tlp
