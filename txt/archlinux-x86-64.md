### Форматирование разделов

```sh
mkfs.ext2 /dev/sda1 -L ARCHBOOT
```
```sh
mkswap /dev/sda2 -L ARCHSWAP
```
```sh
mkfs.ext4 /dev/sda3 -L ARCHROOT
```
```sh
mkfs.ext4 /dev/sda4 -L ARCHHOME
```
### Монтирование разделов
```sh
mount /dev/sda3 /mnt
```
```sh
mkdir /mnt/{boot,home}
```
```sh
mount /dev/sda1 /mnt/boot
```
```sh
mount /dev/sda4 /mnt/home
```
```sh
swapon /dev/sda2
```
### Выбор зеркал
```sh
echo -e "Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch\nServer = https://mirror.yandex.ru/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
```
### Установка пакетов
```sh
pacstrap -i /mnt base base-devel linux linux-headers grub
```