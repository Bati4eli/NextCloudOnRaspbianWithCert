### * качаем iso с сайта
### * скачиваем win32DiskImager - делаем установочную флешку
### * вставляем и запускаем малину
### * ждем..... выкллючаем
### * создаем в корне файл с именем "ssh"
### * подключаемся по ssh с логином: pi / raspberry
### *********


#### обновление для 64 бит
#### https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=250730
sudo rpi-update
sudo nano /boot/config.txt
# добавить строку:
arm_64bit=1


### UPDATE
sudo apt-get update && sudo apt-get dist-upgrade

### ***** DOCKER *******************************
$ curl -fsSL https://get.docker.com -o get-docker.sh
sudo usermod -aG docker pi
newgrp docker

### Optionally, store containers in an external USB drive. Change the following line (adjust accordingly)
ExecStart=/usr/bin/dockerd -g /mnt/hdd/docker -H fd://

### ***** DOCKER-COMPOSE *************************
### source: https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl

### IMPORTANT! Install proper dependencies
sudo apt-get install -y libffi-dev libssl-dev

sudo apt-get install -y python3 python3-pip

sudo apt-get remove python-configparser


### МОНТИРОВАНИЕ ДИСКА ******************************
pi@raspberrypi:~ $ fdisk -l
### Disk /dev/sda: 1.8 TiB, 2000398933504 bytes, 3907029167 sectors
### Disk model: D3 Station
### Units: sectors of 1 * 512 = 512 bytes
### Sector size (logical/physical): 512 bytes / 512 bytes
### I/O size (minimum/optimal): 512 bytes / 512 bytes
### Disklabel type: dos
### Disk identifier: 0xe98498e7

pi@raspberrypi:~ $ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0  1.8T  0 disk
└─sda1        8:1    0  1.8T  0 part
mmcblk0     179:0    0 29.7G  0 disk
├─mmcblk0p1 179:1    0  256M  0 part /boot
└─mmcblk0p2 179:2    0 29.5G  0 part /

### Прежде, чем монтировать разделы, нужно создать точки монтирования. 
### Точки монтирования следует создавать в каталогах /mnt или /media.
### Пример: Для того, чтобы создать точку монтирования с названием /mnt/hdd в консоли даём команду:

sudo mkdir /mnt/hdd
sudo chmod 777 /mnt/hdd
### монтируем раздел /dev/sda1 типа ext4 в точку монтирования /mnt/hdd
sudo mount -t ext4 /dev/sda1 /mnt/hdd
### для постоянного монтирования добавляем строку в файл /etc/fstab  
	(sudo nano /etc/fstab)
/dev/sda1	/mnt/hdd	ext4	user,auto,rw	0	0
