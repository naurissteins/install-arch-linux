Create disk partitions
```
gdisk /dev/sda
```

Format boot and file system disk
```
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
```

Mount system disk
```
mount /dev/sda2 /mnt
```

Create boot folder and mount it
```
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
```

Install Linux base packages
```
pacstrap /mnt linux linux-firmware nano git amd-ucode
```

Generate fstab
```# AMD
# pacman -S amd-ucode


# Intel
# pacman -S intel ucode

genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

Switch to arch chroot
```
arch-chroot /mnt
```

Clone Arch Install
```
git clone https://github.com/naurelijs/install-arch-linux.git
```
