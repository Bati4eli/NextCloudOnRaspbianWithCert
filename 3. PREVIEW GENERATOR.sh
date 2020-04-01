### todo http://blog.sedicomm.com/2017/07/24/kak-dobavit-zadanie-v-planirovshhik-cron-v-linux-unix/

### Если вы установили preview generator то придется дергать его с хостовой машины с помощью
### планировщика cron

crontab -e
#ADD:
# выполнять скрипт backupscript каждые 5 минут #
*/5 * * * *   /app/cron_generator.sh
# выполнять скрипт backupscript каждый день в час ночи #
0 1 * * *     /app/cron_generator_settigs.sh
