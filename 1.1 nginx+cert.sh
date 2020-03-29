### setup nginx
### https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md

sudo apt update
sudo apt install nginx
sudo /etc/init.d/nginx start

sudo nano /etc/nginx/nginx before cert.conf
###todo добавляем блок server{} как в примере configs/nginx-before-cert.conf

###############################################################################
#### СМОТРИ в https://habr.com/ru/post/318952/                              ###
####todo а лучше: https://certbot.eff.org/lets-encrypt/debianbuster-nginx   ###
###############################################################################
sudo certbot --nginx

костыли которые могут помочь
#1
  sudo nano /etc/pip.conf
  # Закомментить: extra-index-url=https://www.piwheels.org/simple"
  # source: https://www.raspberrypi.org/forums/viewtopic.php?t=238176
#2
  #todo ЕСЛИ ЧТО-ТО не идёт, пробуй комментировать строки в /etc/letsencrypt/cli.ini

### Лог успеха:
#    pi@raspberrypi:~ $ sudo certbot --nginx
#    Saving debug log to /var/log/letsencrypt/letsencrypt.log
#    Plugins selected: Authenticator nginx, Installer nginx
#    Enter email address (used for urgent renewal and security notices) (Enter 'c' to
#    cancel): mister.happyend@yandex.ru
#
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    Please read the Terms of Service at
#    https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
#    agree in order to register with the ACME server at
#    https://acme-v02.api.letsencrypt.org/directory
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    (A)gree/(C)ancel: A
#
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    Would you be willing to share your email address with the Electronic Frontier
#    Foundation, a founding partner of the Let's Encrypt project and the non-profit
#    organization that develops Certbot? We'd like to send you email about our work
#    encrypting the web, EFF news, campaigns, and ways to support digital freedom.
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    (Y)es/(N)o: Y
#
#    Which names would you like to activate HTTPS for?
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    1: bati4eli.ru
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    Select the appropriate numbers separated by commas and/or spaces, or leave input
#    blank to select all options shown (Enter 'c' to cancel): 1
#    Obtaining a new certificate
#    Performing the following challenges:
#    http-01 challenge for bati4eli.ru
#    nginx: [error] invalid PID number "" in "/run/nginx.pid"
#    Waiting for verification...
#    Cleaning up challenges
#    Deploying Certificate to VirtualHost /etc/nginx/nginx before cert.conf
#
#    Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    1: No redirect - Make no further changes to the webserver configuration.
#    2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
#    new sites, or if you're confident your site works on HTTPS. You can undo this
#    change by editing your web server's configuration.
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
#    Redirecting all traffic on port 80 to ssl in /etc/nginx/nginx before cert.conf
#
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#    Congratulations! You have successfully enabled https://bati4eli.ru
#
#    You should test your configuration at:
#    https://www.ssllabs.com/ssltest/analyze.html?d=bati4eli.ru
#    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#
#    IMPORTANT NOTES:
#     - Congratulations! Your certificate and chain have been saved at:
#       /etc/letsencrypt/live/bati4eli.ru/fullchain.pem
#       Your key file has been saved at:
#       /etc/letsencrypt/live/bati4eli.ru/privkey.pem
#       Your cert will expire on 2020-06-24. To obtain a new or tweaked
#       version of this certificate in the future, simply run certbot again
#       with the "certonly" option. To non-interactively renew *all* of
#       your certificates, run "certbot renew"
#     - Your account credentials have been saved in your Certbot
#       configuration directory at /etc/letsencrypt. You should make a
#       secure backup of this folder now. This configuration directory will
#       also contain certificates and private keys obtained by Certbot so
#       making regular backups of this folder is ideal.
#     - If you like Certbot, please consider supporting our work by:
#
#       Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
#       Donating to EFF:                    https://eff.org/donate-le
