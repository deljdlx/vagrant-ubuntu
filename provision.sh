
apt-get update && apt-get upgrade && apt-get dist-upgrade -y


apt-get install -y pkg-config


apt-get install ca-certificates

apt-get install -y vim
apt-get install -y wget
apt-get install -y git
apt-get install -y screen


echo '====Samba utils'
apt-get install -y --allow-unauthenticated smbclient
apt-get install -y --allow-unauthenticated cifs-utils







echo '====Install PHP7'
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.1

apt-get install -y --allow-unauthenticated libssl-dev
apt-get install -y php7.1-dev



apt-get install -y php7.1-json

apt-get install -y php7.1-mcrypt

apt-get install -y php7.1-zip
apt-get install -y php7.1-mbstring
apt-get install -y php7.1-tokenizer
apt-get install -y php7.1-fpm
apt-get install -y php7.1-gd
apt-get install -y php7.1-mysql
apt-get install -y php7.1-cli
apt-get install -y php7.1-common
apt-get install -y php7.1-curl
apt-get install -y php7.1-opcache
apt-get install -y php7.1-imap
apt-get install -y php7.1-sqlite3
apt-get install -y php7.1-xdebug


echo '<?php phpinfo();' > /var/www/html/phpinfo.php

#apt-get install -y php7.1-zlib




echo '====Install PEAR'
apt-get install -y php-pear
pecl channel-update pecl.php.net

echo '====Install Composer'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer



echo '====Install ZMQ'
apt-get install -y libzmq3-dev
pecl install "channel://pecl.php.net/zmq-1.1.3"
echo 'extension=zmq.so' > /etc/php/7.1/mods-available/zmq.ini
echo 'extension=zmq.so' > /etc/php/7.1/cli/conf.d/20-zmq.ini
ln -s /etc/php/7.1/mods-available/zmq.ini /etc/php/7.1/apache2/conf.d/zmq.ini


echo '====Install Memcache'
echo 'deb http://ftp.de.debian.org/debian sid main ' >> /etc/apt/sources.list
apt-get update
apt-get install -y --allow-unauthenticated memcached
apt-get install -y --allow-unauthenticated php-memcached




echo '====Install Apache2'
apt-get install -y --allow-unauthenticated apache2 apache2-doc apache2-utils
a2enmod rewrite
service apache2 restart






export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password root'

echo 'deb [arch=amd64,i386] http://mirror.jmu.edu/pub/mariadb/repo/10.2/ubuntu xenial main' >> /etc/apt/sources.list.d/mariadb.list
echo 'deb-src http://mirror.jmu.edu/pub/mariadb/repo/10.2/ubuntu xenial main' >> /etc/apt/sources.list.d/mariadb.list
apt install -y --allow-unauthenticated mariadb-server
mysql -uroot -proot -e 'grant all privileges on *.* to root identified by "root";' mysql
php -r "file_put_contents('/etc/mysql/mariadb.conf.d/50-server.cnf', preg_replace('/bind-address.*?$/m', 'bind-address	=	*', file_get_contents('/etc/mysql/mariadb.conf.d/50-server.cnf')));"




echo '====Install NPM'
apt-get install -y --allow-unauthenticated npm
mkdir -p /usr/local/lib/node_modules
chown -R ubuntu $(npm config get prefix)/{lib/node_modules,bin,share}







