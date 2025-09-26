#!/bin/bash

bash ../.banner.sh

#updating
echo "MENGECEK UPDATE..."
apt update && upgrade -y

#installing apache2
echo "MENGINSTAL APACHE2..."
apt install apache2 -y

#menginstall bind9
echo "MENGINSTALL BIND9..."
apt install bind9 -y

