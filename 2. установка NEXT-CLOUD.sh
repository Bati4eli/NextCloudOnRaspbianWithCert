### ПОЛЕЗНАЯ СТАТЬЯ:: https://wiki.calculate-linux.org/ru/working_with_nextcloud

### https://www.galkov.pro/nextcloud_on_docker/
### создаем папку для хранения параметров развертывания контейнеров
mkdir /app

### создаем файл с параметрами развертывания контейнеров /etc/docker/nc/docker-compose.yml
### см. docker-compose.yml
### ЗАПУСК
cd /app
sudo docker-compose -f up -d

#показать команду запуска целиком
docker ps --no-trunc
sudo docker-compose up -d --force-recreate
sudo docker-compose logs
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

### Выполняем проверку системы на странице админа
### наверника там будет проблема с индексами и пример команды
### Для того чтобы пофиксить эту проблему:
docker exec -u www-data -it app_app_1 bash
  php {команда}
exit # - выход из терминала контейнера

### Если вы обновляли файлы или лобавляли новые В ОБХОД веба или DAV
### То нужно пересканировать библиотеку командой внутри контейнера:
### {USER_NAME} - указать в каком пользователе копались
sudo chown www-data:www-data -R /mnt/hdd/ncdata/USER_NAME/files
docker exec -u www-data -it app_app_1 bash
  php occ files:scan USER_NAME
  php occ trashbin:cleanup --all-users
exit



### Если нужно остановить все контейнеры:
sudo docker-compose stop
### Эта команда позволяет останавливать и удалять контейнеры и другие ресурсы, 
### созданные командой docker-compose up:
sudo docker-compose down -v

