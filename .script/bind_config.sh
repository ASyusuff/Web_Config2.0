#!/bin/bash

bash ../.banner.sh

source data/ip.txt
source data/domain.txt

#konfigurasi top level domain 
cat > /etc/bind/named.conf.local << EOF
zone "$root_domain1" {
	type master;
	file "/etc/bind/forward";
};

zone "$octet3.$octet2.$octet1.in-addr.arpa" {
	type master;
	notify no;
	file "/etc/bind/reverse";
};

EOF

#menyalin code forward & reverse
cp /etc/bind/db.local /etc/bind/forward
cp /etc/bind/db.127 /etc/bind/reverse

#editing file forward
dell_code1="@	IN	A	127.0.0.1"
dell_code2="@	IN	AAAA	::1"

sed -i "/$dell_code1/,/$dell_code2/d" "/etc/bind/forward"
sed -i "s/localhost/$root_domain1/g" "/etc/bind/forward"


line_forward="@	IN	NS	$root_domain1."

sed -i "/$line_forward/a\\
@	IN	A	$ip_address\\
$sub_domain1	IN	A	$ip_address\\
$sub_domain2	IN	A	$ip_address
" "/etc/bind/forward"


#editing file reverse
dell_code3="1.0.0	IN	PTR	localhost."

sed -i "\|$dell_code3|d" "/etc/bind/reverse"
sed -i "s/localhost/$root_domain1/g" "/etc/bind/reverse"

line_reverse="@	IN	NS	$root_domain1".

sed -i "/$line_reverse/a\\
$octet4	IN	PTR	$root_domain1.\\
$octet4	IN	PTR	$main_domain.\\
$octet4	IN	PTR	$sub_domain." /etc/bind/reverse

#global firward options
cat > /etc/bind/named.conf.options << EOF
options {
	directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

	forwarders {
		8.8.8.8;
	};

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
	dnssec-validation no;

	listen-on-v6 { any; };
};
EOF

systemctl restart bind9.service
