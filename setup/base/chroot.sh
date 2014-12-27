#!/bin/bash

# Setup locals
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen

# Setup keymap
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# Setup timezone
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc

# Create ramdisk
mkinitcpio -p linux

# Read and set password
read -p "Enter a root password: " password
echo
echo "root:$password" | chpasswd

# Read our UUIDs from /etc/fstab
uroot=$(grep -oP "(?<=UUID=)\S*(?=\s*/\s)" /etc/fstab)
proot=$(blkid -o value /dev/disk/by-uuid/$uroot | sed -n '4p')

uboot="$(grep -oP "(?<=UUID=)\S*(?=\s*/boot\s)" /etc/fstab)"
pboot="$(blkid -c /dev/null | grep -oP ".*(?=: UUID=\"$uboot\")")"
pnboot="${pboot: -1}"
dboot="${pboot%?}"

# Install efistub entry
pacman -S --noconfirm efibootmgr
efibootmgr -d $dboot -p $pnboot -c -L "Arch Linux" -l /vmlinuz-linux -u "root=PARTUUID=$proot rw initrd=/initramfs-linux.img"

# Run main setup script
./setup.sh