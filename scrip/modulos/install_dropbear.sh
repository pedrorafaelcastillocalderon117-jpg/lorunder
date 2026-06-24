#!/bin/bash
# Instalador de Dropbear

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${CYAN}====================================================${NC}"
echo -e "${YELLOW}               INSTALADOR DE DROPBEAR               ${NC}"
echo -e "${CYAN}====================================================${NC}"

# Instalación
echo -e "${GREEN}Instalando Dropbear...${NC}"
apt-get install dropbear -y &>/dev/null

# Configuración por defecto
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=.*/DROPBEAR_EXTRA_ARGS="-p 109 -p 110"/g' /etc/default/dropbear

# Reiniciar servicio
systemctl restart dropbear
systemctl enable dropbear &>/dev/null

echo -e "${GREEN}Dropbear ha sido instalado y configurado en los puertos 143, 109 y 110.${NC}"
echo -e "${CYAN}====================================================${NC}"
read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
