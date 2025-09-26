#!/bin/bash
clear
bash ../.banner.sh  

read -p "Masukan nama domain utama untuk web: " main_domain
read -p "Masukan nama sub-domain untuk web: " sub_domain

cat > data/domain.txt << EOF
main_domain=$main_domain
sub_domain=$sub_domain
root_domain1=$root_domain1
root_domain2=$root_domain2
sub_domain1=$sub_domain1
sub_domain2=$sub_domain2
EOF

bash apache2_confing.sh
bash bind_config.sh