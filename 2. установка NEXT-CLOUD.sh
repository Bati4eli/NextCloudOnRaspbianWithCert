### https://www.galkov.pro/nextcloud_on_docker/
### создаем папку для хранения параметров развертывания контейнеров
mkdir /app


### создаем файл с параметрами развертывания контейнеров /etc/docker/nc/docker-compose.yml
### см. docker-compose.yml
### ЗАПУСК
sudo docker-compose -f /app/docker-compose.yml up -d
### ИЛИ
cd /app
sudo docker-compose -f up -d

# !!!!!!!!!!!
#TODO ВАЖНО посмотри после развертки контейнера.. конфиг: {nextcloud}/config/config.php
#TODO Если этого не сделать, то приложение спрятанное за https прокси будет генерить невалидные ссылки
#баг был описан здесь: https://github.com/nextcloud/server/issues/13713

    // (стоковые настройки удалены отсюда)
    // ОЧЕНЬ ВАЖНО ДОБАВИТЬ В {nextcloud}/config/config.php
    // Эти настройки:
    'overwritehost' => 'bati4eli.ru',
    'overwriteprotocol' => 'https',
    'overwrite.cli.url' => 'https://bati4eli.ru',
    'trusted_domains' =>
    array (
      0 => 'bati4eli.ru',
      1 => '192.168.1.75',
    ),

### Выполняем рекомендации приложения: https://bati4eli.ru/settings/admin/overview
docker exec -u www-data -it app_app_1 bash
  php occ db:add-missing-indices
  php occ db:convert-filecache-bigint
exit

### занимаемся любовью с доступом к файлам после записи их извне
sudo chown www-data:www-data -R /mnt/hdd/ncdata/bati4eli/files;
sudo find /mnt/hdd/ncdata/bati4eli/files -type f -exec chmod 644 {} \;
sudo find /mnt/hdd/ncdata/bati4eli/files -type d -exec chmod 755 {} \;

sudo chown www-data:www-data -R /mnt/hdd/ncdata/tweetyOlka/files;
sudo find /mnt/hdd/ncdata/tweetyOlka/files -type f -exec chmod 644 {} \;
sudo find /mnt/hdd/ncdata/tweetyOlka/files -type d -exec chmod 755 {} \;

docker exec -u www-data -it app_app_1 bash
  php occ files:scan --all
exit
## после внесения изменений перезапускаем:
sudo docker-compose restart

### STOP
sudo docker-compose stop
### Эта команда позволяет останавливать и удалять контейнеры и другие ресурсы, 
### созданные командой docker-compose up:
sudo docker-compose down -v

