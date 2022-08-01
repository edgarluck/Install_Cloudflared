#!/bin/bash
#############################################
## Code by @edgarluck                      ##
## Creado : 31/07/2022                     ##
## GITHUB : https://github.com/edgarluck/  ##
#############################################
##################
##              ##
##   COLORES F  ##
##              ##
######################################
R='\e[1;31m' # Rojo fuerte         ###
G='\e[1;32m' # Verde Fuerte        ###
Y='\e[1;33m' # Amarillo Fuerte     ###
B='\e[1;34m' # Azul fuerte         ###
M='\e[1;35m' # Purpura o algo asi  ###
C='\e[1;36m' # Cyan color fuerte   ###
W='\e[1;37m' # Blanco Fuerte       ###
P='\e[1;35m' # Purpura             ###
Green='\e[32m' # Verde             ###
Gr='\e[5m\e[32m' # verde           ###
Gris='\e[90m' # Gris               ###
######################################
WG='\e[1;37m\e[42m'
WR='\e[1;37m\e[41m'
reset='\e[0m'

trap ctrl_c 2
function ctrl_c {
echo
echo -e $B"[+]$W Finalizado"
echo -e $B"[+]$W Code by @edgarluck"
echo -e $B"[+]$W Telegram: https://t.me/Linux_Informatic"
echo
echo 
exit
}
dependencia(){
printf "\e[1;92m"
command -v wget > /dev/null 2>&1 || { echo -e >&2 "Requiero wget. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v neofetch > /dev/null 2>&1 || { echo -e >&2 "Requiero neofetch. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
}

function run {
neofetch > neo
OS=$(cat neo |grep OS |cut -d ":" -f2)
OS1=$(uname -o)
echo
echo
echo -e "$G[+]${W} Detectanto SO..."
sleep 2
echo -e "$G[+]${W} Espere..."
sleep 2
if [ "${OS1}" == "Android" ]; then
echo -e "$G[+]${W} SO Detectado${C} :${G} Termux ($OS)"
sleep 0.8
menu-ocp
elif [ "${OS1}" == "GNU/Linux" ]; then
echo -e "$G[+]${W} SO Detectado${C} :${G} $OS"
sleep 0.8
if [[ -f neo ]]; then
rm neo
fi
menu-ocp
fi
}
function banner {

echo -e ${G}"  ____ _                 _  __ _                    _ "
echo -e " / ___| | ___  _   _  __| |/ _| | __ _ _ __ ___  __| |"
echo -e "| |   | |/ _ 1| | | |/ _1 | |_| |/ _  |  __/ _ \/ _1 |"
echo -e "| |___| | (_) | |_| | (_| |  _| | (_| | | |  __/ (_| |"
echo -e " \____|_|\___/ \__,_|\__,_|_| |_|\__,_|_|  \___|\__,_|"
echo -e "                ${WR}create by @edgarluck$reset"
echo -e "        $WG.: https://github.com/edgarluck :.$reset"
}
function cloudflared-download {
echo -e "${G}[+]${W} Descargando cloudflared ..."
echo -e "${G}[${W}--${G}]"
case `dpkg --print-architecture` in
aarch64)
    arquitectura="arm64" ;;
arm)
    arquitectura="arm" ;;
armhf)
    arquitectura="arm" ;;
amd64)
    arquitectura="amd64" ;;
i*86)
    arquitectura="386" ;;
x86_64)
    arquitectura="amd64" ;;
*)
    echo "$R[$Y!!$R] Arquitectura no soportada :("
esac
wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${arquitectura} -O cloudflared
}
function cloudflared-install {
OS1=$(uname -o)
if [ "$OS1" == "Android" ]; then
chmod 777 cloudflared
mv cloudflared $PREFIX/bin
if [ -f $PREFIX/bin/ngrok ]; then
echo -e "$G[+]$W"
echo -e "$G[+]$W Listo"
echo -e "$G[+]$W Para usar ejecute : cloudflared tunnel -url 127.0.0.1:<puerto>"
echo -e "$G[+]$W Ejemplo : cloudflared tunnel -url 127.0.0.1:8080"
echo -e "$G[+]$W Telegram${C} :${G} https://t.me/Linux_Informatic"
echo
echo
exit 1
fi
elif [ "$OS1" == "GNU/Linux" ]; then
chmod 777 cloudflared
mv cloudflared /usr/local/bin
if [ -f /usr/local/bin/cloudflared ]; then
echo -e "$G[+]$W"
echo -e "$G[+]$W Listo"
echo -e "$G[+]$W Para usar ejecute : cloudflared tunnel -url 127.0.0.1:<puerto>"
echo -e "$G[+]$W Ejemplo : cloudflared tunnel -url 127.0.0.1:8080"
echo -e "$G[+]$W Telegram : https://t.me/Linux_Informatic"
echo
echo
exit 1
fi
fi
}
function menu-ocp {
echo
echo
echo -e "       ${G}[${C} 01${G} ]${W} Descargar e instalar cloudflared"
echo -e "       ${G}[${C} 02${G} ]${W} Canal de Youtube && Suscribete"
echo -e "       ${G}[${C} 03${G} ]${W} GitHub"
echo -e "       ${G}[${C} 04${G} ]${W} Grupo de Telegram"
echo -e "       ${G}[${C} 05${G} ]${W} Contacto con el desarrollador"
echo -e "       ${G}[${C} 06${G} ]${W} Salir :)"
echo
echo 
ocp
}
function ocp {
echo -e -n "$W[ cloudflared-install ] > "
read -r a
case $a in
  1|01)
    cloudflared-download
    cloudflared-install
    ;;
  2|02)
    OS1=$(uname -o)
    if [ "$OS1" == "Android" ]; then
    termux-open https://youtube.com/channel/UCVCklEUJuOhydbySEbY5_eA
    ocp
    elif [ "$OS1" == "GNU/Linux" ]; then
    echo -e "${G}Canal de Youtube$W =>$Y https://youtube.com/channel/UCVCklEUJuOhydbySEbY5_eA"
    fi
    ocp
    ;;
  3|03)
    OS1=$(uname -o)
    if [ "$OS1" == "Android" ]; then
    termux-open https://github.com/edgarluck/
    ocp
    elif [ "$OS1" == "GNU/Linux" ]; then
    echo -e "${G}GIT HUB$W => ${Y}https://github.com/edgarluck/"
    fi
    ocp
    ;;
  4|04)
    OS1=$(uname -o)
    if [ "$OS1" == "Android" ]; then
    termux-open https://t.me/Linux_Informatic
    ocp
    elif [ "$OS1" == "GNU/Linux" ]; then
    echo -e "${G}Grupo de Telegram ${W}=>$Y https://t.me/Linux_Informatic"
    fi
    ocp
    ;;
  5|05)
    echo 
	echo
	echo -e "$C=========================="
	echo -e "${G}CONTACTO DEL DESARROLLADOR"
	echo -e "$C=========================="
	echo 
	echo -e "${C}Telegram ==> https://t.me/edgarluck"
	echo -e "${G}WhatsApp ==> +51 938454671"
	echo
	echo
    ocp
    ;;
  6|06)
    echo -e "$R[$Y!!$R] SALIENDO ..."
    exit 1
    ;;
  *)
    if [[ "$a" != "" ]]; then
	echo -e "$R[${Y}!!$R] Comando invalido: ${a}"
    sleep 0.5
    ocp
    else
    ocp
    fi
	;;
esac
}
dependencia
banner
run
