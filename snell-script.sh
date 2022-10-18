#!/bin/sh
#Declaration of variable

CONFPATH="/etc/snell/snell-server.conf"
SYSTEMD="/etc/systemd/system/snell.service"

#Variable to change that you will have to configure on your clients
#generate your PSK 1313 Characters this one is for example
#echo "Enter PSK 31 Characters"
#read PSK
PSK="6NvFIU307v9xy7iycvpiuPD6Ihxql0V"

#Ports you want the server to listen to here we choose 443, note that 443 is open on AWS security group
#echo "Enter port to listen"
#read PORTS
PORTS="443"

#Echo "Enter obfs http or tls"
#read OBFS

OBFS="http"

wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v3.0.1/snell-server-v3.0.1-linux-amd64.zip
unzip -o snell.zip
chmod +x snell-server
mv -f snell-server /usr/local/bin/

mkdir /etc/snell/
echo "Generating snell-server.conf"
echo "[snell-server]" >>${CONFPATH}
echo "listen = 0.0.0.0:${PORTS}" >>${CONFPATH}
echo "psk = ${PSK}" >>${CONFPATH}
echo "obfs = ${OBFS}" >>${CONFPATH}

systemctl daemon-reload
systemctl restart snell

#Copy of the file daemon from Snell Github: https://github.com/surge-networks/snell
echo "Setting systemd for autostart"
echo "[Unit]" >>${SYSTEMD}
echo "Description=Snell Proxy Service" >>${SYSTEMD}
echo "After=network.target" >>${SYSTEMD}
echo "" >>${SYSTEMD}
echo "[Service]" >>${SYSTEMD}
echo "Type=simple" >>${SYSTEMD}
echo "LimitNOFILE=32768" >>${SYSTEMD}
echo "ExecStart=/usr/local/bin/snell-server -c /etc/snell/snell-server.conf" >>${SYSTEMD}
echo "" >>${SYSTEMD}
echo "[Install]" >>${SYSTEMD}
echo "WantedBy=multi-user.target" >>${SYSTEMD}

#Last restart of services
systemctl daemon-reload
systemctl enable snell
systemctl start snell