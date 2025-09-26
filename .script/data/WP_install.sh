#!/bin/bash

bash .banner.sh

apt install apache2 mariadb php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-mysql -y

apt install mariadb-server -y

mysql_secure_installation <<EOF
cihuy
n
n
y
y
y
y
EOF

echo "CREATE DATABASE [namaData];"
echo "CREATE USER '[user]'@localhost' IDENTIFIED BY '[password]';"
echo "GRANT ALL PRIVILEGES ON [namaData].* TO '[user]'@localhost';"
echo "FLUSH PRIVILEGES;"
mariadb


wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress /var/www/$DR2
