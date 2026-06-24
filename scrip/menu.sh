#!/bin/bash
# Menú Principal del Script VPS

# Colores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Función de limpiar pantalla y banner
show_menu() {
    clear
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${WHITE}           ADMINISTRADOR DE VPS - SCRIPT             ${NC}"
    echo -e "${CYAN}====================================================${NC}"
    echo -e " ${YELLOW}OS:${NC} $(lsb_release -d | awk -F"\t" '{print $2}')"
    echo -e " ${YELLOW}IP:${NC} $(curl -s ifconfig.me)"
    echo -e "${CYAN}====================================================${NC}"
    echo -e ""
    echo -e " ${GREEN}[1]${NC} Crear Usuario SSH/Dropbear"
    echo -e " ${GREEN}[2]${NC} Eliminar Usuario SSH/Dropbear"
    echo -e " ${GREEN}[3]${NC} Instalar Dropbear"
    echo -e " ${GREEN}[4]${NC} Instalar Stunnel4 (SSL/TLS)"
    echo -e " ${GREEN}[5]${NC} Instalar Squid Proxy"
    echo -e " ${GREEN}[6]${NC} Instalar V2Ray (VMess + WS)"
    echo -e " ${GREEN}[7]${NC} Instalar OpenVPN"
    echo -e " ${GREEN}[8]${NC} Monitor de Usuarios Conectados"
    echo -e " ${GREEN}[9]${NC} Instalar BadVPN (UDPGW)"
    echo -e " ${GREEN}[10]${NC} Optimizar y Limpiar RAM"
    echo -e " ${GREEN}[11]${NC} Instalar BBR Plus (Acelerador)"
    echo -e " ${GREEN}[0]${NC} ${RED}Salir${NC}"
    echo -e ""
    echo -e "${CYAN}====================================================${NC}"
    
    read -p " Selecciona una opción: " opcion

    case $opcion in
        1)
            /etc/script_vps/modulos/user_add.sh
            ;;
        2)
            /etc/script_vps/modulos/user_del.sh
            ;;
        3)
            /etc/script_vps/modulos/install_dropbear.sh
            ;;
        4)
            /etc/script_vps/modulos/install_stunnel.sh
            ;;
        5)
            /etc/script_vps/modulos/install_squid.sh
            ;;
        6)
            /etc/script_vps/modulos/install_v2ray.sh
            ;;
        7)
            /etc/script_vps/modulos/install_openvpn.sh
            ;;
        8)
            /etc/script_vps/modulos/monitor_users.sh
            ;;
        9)
            /etc/script_vps/modulos/install_badvpn.sh
            ;;
        10)
            /etc/script_vps/modulos/optimizar.sh
            ;;
        11)
            /etc/script_vps/modulos/install_bbr.sh
            ;;
        0)
            clear
            exit 0
            ;;
        *)
            echo -e "${RED}Opción inválida.${NC}"
            sleep 2
            ;;
    esac
    show_menu
}

# Bucle del menú
show_menu
