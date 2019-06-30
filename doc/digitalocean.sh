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
ufw allow http
ufw enable

# All these below should be inside docker container

# Install application environment
apt install nginx
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

