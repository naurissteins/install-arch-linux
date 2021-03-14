#!/bin/bash
# Battery saveing
pacman -S --noconfirm acpi acpi_call tlp
systemctl enable acpid
systemctl enable tlp
