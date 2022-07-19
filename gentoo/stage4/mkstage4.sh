mount /dev/mapper/hd-root /mnt/gentoo
mount /dev/sda1 /mnt/gentoo/boot/efi
cd /mnt/gentoo
tar cjpvf ~/stage4.tar.bz2 -X ~/stage4.excl .
cd
umount /dev/sda1
umount /dev/mapper/hd-root
