### https://www.galkov.pro/nextcloud_on_docker/
### создаем папку для хранения параметров развертывания контейнеров
mkdir /etc/docker/nc

### создаем файл с параметрами развертывания контейнеров /etc/docker/nc/docker-compose.yml
### см. docker-compose.yml

#sudo mkdir /var/www
#sudo mkdir /var/www/html
#sudo mkdir /var/www/html/data
#sudo chmod 777 /var/www
#
#sudo mkdir /var/lib/postgresql
#sudo mkdir /var/lib/postgresql/data
#sudo chmod 777 /var/lib/postgresql
#
#### SQL команды
#create database nextcloud;
#CREATE USER "'nextcloud'@'%'" WITH PASSWORD '#TODOPASS' ;
#GRANT ALL PRIVILEGES ON DATABASE nextcloud TO "'nextcloud'@'%'";

### ЗАПУСК
sudo docker-compose -f /app/docker-compose.yml up -d
### ИЛИ
cd /app
sudo docker-compose -f up -d

### STOP
sudo docker-compose stop

### Эта команда позволяет останавливать и удалять контейнеры и другие ресурсы, 
### созданные командой docker-compose up:
sudo docker-compose down -v