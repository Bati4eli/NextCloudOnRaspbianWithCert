PATH=$PATH:/bin:/usr/bin:/usr/sbin
SHELL=/bin/bash
echo "cron_generator.sh START"
docker exec -u www-data:www-data -it app_app_1 bash -c "php ./occ preview:pre-generate"
echo "cron_generator.sh EXIT"