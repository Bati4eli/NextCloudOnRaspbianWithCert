PATH=$PATH:/bin:/usr/bin:/usr/sbin
SHELL=/bin/bash
echo "START settings preview generator"
docker exec -u www-data:www-data -it app_app_1 bash -c "php ./occ config:app:set --value=\"32 64 1024\"  previewgenerator squareSizes";
docker exec -u www-data:www-data -it app_app_1 bash -c "php ./occ config:app:set --value=\"64 128 1024\" previewgenerator widthSizes";
docker exec -u www-data:www-data -it app_app_1 bash -c "php ./occ config:app:set --value=\"64 256 1024\" previewgenerator heightSizes";
echo "END settings preview generator"
