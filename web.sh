#!/bin/bash

bash .banner.sh


echo "[+=======================|Menu Web Server|=======================+]"
echo "> 1. Setup Web Server(Apache2 + Bind9)"
echo "> 2. install wordpress + mysql"
echo "> 3. Change ip address"
echo "> 4. Change Domain"
echo "> Q = Keluar"

read -p "masukan pilihan: " pilihan

if [ "$pilihan" = "1" ]; then
    bash .script/input.sh
    bash .script/install_requirements.sh
    bash .script/apache2_confing.sh
    bash .script/bind_config.sh
elif [ "$pilihan" = "2" ]; then
    bash .script/wordpress_install.sh
elif [ "$pilihan" = "3" ]; then
    bash .script/ip_change.sh
elif [ "$pilihan" = "4" ]; then
    bash .script/domain_change.sh
elif [[ "$pilihan" = "q" || "$pilihan" = "Q" ]]; then
    echo "Keluar..."
    exit 0
else
    bash web.sh
fi