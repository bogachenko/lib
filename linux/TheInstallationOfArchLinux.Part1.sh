#!/bin/bash

# Automatic installation and configuration of Arch Linux.
# Author: Bogachenko Vyacheslav
# Mail: bogachenkove@gmail.com

loadkeys ru
setfont cyr-sun16

echo 'Синхронизация системных часов'
timedatectl set-ntp true

echo 'Cоздание разделов'
(
  echo o;

  echo n;
  echo;
  echo;
  echo;
  echo +100M;

  echo n;
  echo;
  echo;
  echo;
  echo +20G;

  echo n;
  echo;
  echo;
  echo;
  echo +1024M;

  echo n;
  echo p;
  echo;
  echo;
  echo a;
  echo 1;

  echo w;
) | fdisk /dev/sda

echo 'Ваша разметка диска'
fdisk -l

echo 'Форматирование дисков'
mkfs.ext2  /dev/sda1 -L Arch Linux Boot
mkfs.ext4  /dev/sda2 -L Arch Linux Root
mkswap /dev/sda3 -L Arch Linux Swap
mkfs.ext4  /dev/sda4 -L Arch Linux Home

echo 'Монтирование дисков'
mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
swapon /dev/sda3
mount /dev/sda4 /mnt/home

echo 'Установка основных пакетов'
pacstrap /mnt base base-devel linux linux-firmware vim dhcpcd netctl

echo 'Настройка системы'
genfstab -pU /mnt >> /mnt/etc/fstab

