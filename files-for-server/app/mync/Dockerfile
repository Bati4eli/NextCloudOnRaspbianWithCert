FROM nextcloud:apache

# запись конфига php.ini
ARG recommended=/usr/local/etc/php/conf.d/opcache-recommended.ini
ARG memoryLimit=/usr/local/etc/php/conf.d/memory-limit.ini
ARG cronFilePath=/etc/cron.d/cron-file

COPY cron-file $cronFilePath

# Установка пакетов: крон, для обработки фоток и видео  # apt-transport-https
RUN apt-get update && apt-get install -y cron imagemagick ffmpeg;

# прописываем конфигурацию для PHP
RUN echo 'request_terminate_timeout=600' >> $recommended; \
    \
    echo 'memory_limit=2000M' > $memoryLimit; \
    \
    echo 'upload_max_filesize=20G' >> $memoryLimit; \
    \
    echo 'post_max_size=21G' >> $memoryLimit; \
    \
    chmod 0644 $cronFilePath; \
    crontab $cronFilePath; \
    touch /var/log/cron.log

# настройка планировщика
# todo https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container
# Copy cron-file file to the cron.d directory

# CMD cron && tail -f /var/log/cron.log

ENV NEXTCLOUD_UPDATE=1
ENTRYPOINT ["/entrypoint.sh", "apache2-foreground"]
### ENTRYPOINT ["/entrypoint.sh", "apache2-foreground", "cron" , "tail -f /var/log/cron.log"]
