PATH=$PATH:/bin:/usr/bin:/usr/sbin
SHELL=/bin/bash
docker exec -u www-data:www-data -it app_app_1 bash -c "php ./occ preview:pre-generate"