#!/bin/bash

#input data user
read -p "Masukan ip address untuk web server: " ip_address
read -p "Masukan nama domain utama untuk web: " main_domain
read -p "Masukan nama sub-domain untuk web: " sub_domain
read -p "Masukan nama untuk DocumentRoot: " DR1
read -p "DocumentRoot ke-2: " DR2

#pengolahan data user yang di input
IFS='.' read -r octet1 octet2 octet3 octet4 <<< "$ip_address"
IFS='.' read -r sub_domain1 root_domain1  <<< "$main_domain"
IFS='.' read -r sub_domain2 root_domain2  <<< "$sub_domain"

cat > data/ip.txt << EOF
ip_address=$ip_address
octet1=$octet1
octet2=$octet2
octet3=$octet3
octet4=$octet4
EOF

cat > data/domain.txt << EOF
main_domain=$main_domain
sub_domain=$sub_domain
root_domain1=$root_domain1
root_domain2=$root_domain2
sub_domain1=$sub_domain1
sub_domain2=$sub_domain2
EOF

cat > data/DocRoot.txt << EOF
DR1=$DR1
DR2=$DR2
EOF


