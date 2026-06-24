#!/bin/bash
# Instalador de BadVPN UDPGW

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${CYAN}====================================================${NC}"
echo -e "${YELLOW}              INSTALADOR DE BADVPN (UDPGW)          ${NC}"
echo -e "${CYAN}====================================================${NC}"

echo -e "${GREEN}Instalando dependencias de compilación...${NC}"
apt-get install cmake make gcc -y &>/dev/null

echo -e "${GREEN}Descargando y compilando BadVPN...${NC}"
cd /tmp
wget -q https://github.com/ambrop72/badvpn/archive/master.zip
unzip -q master.zip
cd badvpn-master
mkdir build
cd build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 &>/dev/null
make &>/dev/null
cp badvpn-udpgw /usr/bin/badvpn-udpgw
chmod +x /usr/bin/badvpn-udpgw

echo -e "${YELLOW}Creando servicio de sistema para BadVPN (Puerto 7300)...${NC}"
cat <<EOF > /etc/systemd/system/badvpn.service
[Unit]
Description=BadVPN UDPGW
After=network.target

[Service]
ExecStart=/usr/bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable badvpn &>/dev/null
systemctl start badvpn &>/dev/null

rm -rf /tmp/master.zip /tmp/badvpn-master

echo -e "${CYAN}====================================================${NC}"
echo -e "${GREEN}BadVPN instalado correctamente y corriendo en el puerto 7300.${NC}"
echo -e "Esto permitirá el reenvío de paquetes UDP para videollamadas y juegos."
echo -e "${CYAN}====================================================${NC}"
read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
