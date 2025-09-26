#!/bin/bash
clear
bash ../.banner.sh

read -p "Masukan ip address untuk web server: " ip_address

IFS='.' read -r octet1 octet2 octet3 octet4 <<< "$ip_address"

cat > data/ip.txt << EOF
ip_address=$ip_address
octet1=$octet1
octet2=$octet2
octet3=$octet3
octet4=$octet4
EOF

bash bind_config.sh