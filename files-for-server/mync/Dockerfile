FROM nextcloud:apache

# Установка пакетов: крон, для обработки фоток и видео
RUN apt-get update && apt-get install -y cron imagemagick ffmpeg
# apt-transport-https

# запись конфига php.ini
ARG phpIniPath=/usr/local/etc/php/memory_limit.ini
RUN echo "memory_limit = 1024M" >> $phpIniPath
RUN chown www-data:www-data $phpIniPath

# настройка планировщика
# todo https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container
# Copy cron-file file to the cron.d directory
ARG cronFilePath=/etc/cron.d/cron-file
COPY cron-file $cronFilePath
RUN chmod 0644 $cronFilePath
# Apply cron job
RUN crontab $cronFilePath
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
# Run the command on container startup
# CMD cron && tail -f /var/log/cron.log

ENV NEXTCLOUD_UPDATE=1

ENTRYPOINT ["/entrypoint.sh", "apache2-foreground"]
