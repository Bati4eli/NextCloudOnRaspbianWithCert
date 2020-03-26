### setup nginx
### https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md

sudo apt update
sudo apt install nginx
sudo /etc/init.d/nginx start

sudo nano /etc/nginx/nginx.conf
###todo добавляем блок server{} как в примере configs/nginx.conf

###  TODO !!! ВАЖНО ВНЕСТИ КОСТЫЛЬ !!!:
sudo nano /etc/pip.conf
# Закомментить: extra-index-url=https://www.piwheels.org/simple"
# source: https://www.raspberrypi.org/forums/viewtopic.php?t=238176

###############################################################################
#### СМОТРИ в https://habr.com/ru/post/318952/                              ###
####todo а лучше: https://certbot.eff.org/lets-encrypt/debianbuster-nginx   ###
###############################################################################

#todo ЕСЛИ ЧТО-ТО не идёт, пробуй комментировать строки в /etc/letsencrypt/cli.ini