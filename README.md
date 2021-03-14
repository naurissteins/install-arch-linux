Create disk partitions
```
gdisk /dev/sda
```

Format boot and file system partitions
```
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
```

Mount system disk partition
```
mount /dev/sda2 /mnt
```

Create boot directory and mount it
```
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
```

Install Linux base packages (AMD default) for intel use: intel-ucode inetutils
```
pacstrap /mnt linux linux-firmware linux-headers base base-devel bash-completion nano git sed amd-ucode
```

Generate fstab
```
genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

Switch to arch chroot
```
arch-chroot /mnt
```

Clone Arch Installation Script
```
git clone https://github.com/naurelijs/install-arch-linux.git
```
