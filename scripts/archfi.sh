#!/bin/bash

# Automatic installation and configuration of Arch Linux.
# Author: Bogachenko Vyacheslav
# Mail: bogachenkove@gmail.com

HEADER="Arch Linux Fast Installer"
CHROOT="arch-chroot /mnt"
EXIT_MSG="You have exited the archfi-script!" 

loadkeys us
KEY_MAP="us"
timedatectl set-ntp true

if [ -d "/sys/firmware/efi/efivars" ]
then
    BOOT_MODE="UEFI"
else
    BOOT_MODE="BIOS"
fi

echo "Checking network connection."
echo "Please wait..."
ping google.com -c 1 >/dev/null 2>&1

if [ $? != "0" ]
	echo "Good, you have an internet connection!"
then
    echo "Network error, please check network connection!"
    exit
fi

sleep 5

title="Hello"
msg="Welcome to the fast installer of Arch Linux!"
dialog --no-cancel --title "$title" --backtitle "$HEADER" --msgbox "$msg" 9 45

parted
mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
swapon /dev/sda3
mount /dev/sda4 /mnt/home


pacstrap /mnt base base-devel linux linux-firmware vim dhcpcd netctl zsh
genfstab -pU /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo "bogachenko" >> /etc/hostname
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
locale-gen
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf
mkinitcpio -p linux
pacman -Syy
pacman -S grub --noconfirm 
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S dialog wpa_supplicant --noconfirm
useradd -m -g users -G wheel -s /bin/bash bogachenko
passwd
passwd bogachenko
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy
echo "Куда устанавливем Arch Linux на виртуальную машину?"
read -p "1 - Да, 0 - Нет: " vm_setting
if [[ $vm_setting == 0 ]]; then
  gui_install="xorg-server xorg-drivers xorg-xinit"
elif [[ $vm_setting == 1 ]]; then
  gui_install="xorg-server xorg-drivers xorg-xinit virtualbox-guest-utils"
fi
pacman -S $gui_install
echo "Какое DE ставим?"
read -p "1 - XFCE, 2 - KDE, 3 - Openbox, 4 - i3 WM: " vm_setting
if [[ $vm_setting == 1 ]]; then
  pacman -Sy xfce4 xfce4-goodies --noconfirm
elif [[ $vm_setting == 2 ]]; then
  pacman -Sy plasma-meta kdebase plasma-wayland-session --noconfirm
elif [[ $vm_setting == 3 ]]; then
  pacman -Sy  openbox xfce4-terminal
elif [[ $vm_setting == 4 ]]; then
  pacman -Sy i3 --noconfirm
fi
pacman -S lxdm --noconfirm
systemctl enable lxdm
pacman -S ttf-liberation ttf-dejavu --noconfirm
pacman -S networkmanager network-manager-applet ppp --noconfirm
systemctl enable NetworkManager
exit
umount -R /mnt
reboot
