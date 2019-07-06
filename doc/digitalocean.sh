#!/bin/sh

# These are the commands/config I'm making to my first DO droplet, setting up the goalsettings.club VM

# Update 
apt update && apt upgrade
# Install essentials
apt install \
    docker \
    docker-compose

USERNAME="filkaris"
# Create user
adduser $USERNAME
# Add to sudoers
usermod -aG sudo $USERNAME
# Allow to ssh in
mkdir /home/$USERNAME/.ssh
cp ~/.ssh/authorized_keys /home/$USERNAME/.ssh/
chown $USERNAME:$USERNAME /home/$USERNAME/.ssh/authorized_keys
chmod 644 /home/$USERNAME/.ssh/authorized_keys

# Set up firewall
ufw allow OpenSSH
ufw enable

# All these below should be inside docker container

# Install application environment
apt install nginx
ufw allow Nginx\ Full
# nginx
# copied minimal setup from symofny
# using user filkaris instead of www-data
# this means having to chage it in /etc/php/7.3/fpm/pool.d/www.conf, so it writes with the correct user

add-apt-repository ppa:ondrej/php
apt-get update
apt install \
    php7.3-fpm \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-intl \
    php7.3-sqlite3 \
    php7.3-zip \
    php7.3-curl \
    unzip 

# Install certbot
apt install software-properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt update
apt install certbot python-certbot-nginx
certbot --nginx

# (Application specific)
# Installed ckeditor which is a js dep. A better option is through webpack
php bin/console ckeditor:install
php bin/console assets:install public

#nginx conf for symfony
#server {
#    if ($host = www.goalsetting.club) {
#        return 301 https://goalsetting.club$request_uri;
#    } # managed by Certbot
#
#    server_name goalsetting.club www.goalsetting.club;
#    root /home/filkaris/goal-setting-club/current/public;
#
#    location / {
#        try_files $uri /index.php$is_args$args;
#    }
#
#    location ~ ^/index\.php(/|$) {
#        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
#        fastcgi_split_path_info ^(.+\.php)(/.*)$;
#        include fastcgi_params;
#        fastcgi_param APP_ENV prod;
#        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
#        fastcgi_param DOCUMENT_ROOT $realpath_root;
#        internal;
#    }
#
#
#    # return 404 for all other php files not matching the front controller
#    # this prevents access to other php files you don't want to be accessible.
#    location ~ \.php$ {
#        return 404;
#    }
#
#    error_log /var/log/nginx/project_error.log;
#    access_log /var/log/nginx/project_access.log;
#
#
#    listen 443 ssl; # managed by Certbot
#    ssl_certificate /etc/letsencrypt/live/goalsetting.club/fullchain.pem; # man aged by Certbot
#    ssl_certificate_key /etc/letsencrypt/live/goalsetting.club/privkey.pem; # m anaged by Certbot
#    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
#    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
#}
#server {
#    if ($host = www.goalsetting.club) {
#        return 301 https://goalsetting.club$request_uri;
#    } # managed by Certbot
#
#
#    if ($host = goalsetting.club) {
#        return 301 https://$host$request_uri;
#    } # managed by Certbot
#
#
#    server_name goalsetting.club www.goalsetting.club;
#    listen 80;
#    return 404; # managed by Certbot
#}
#
