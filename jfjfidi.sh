#!/bin/bash
arquivo=~/dnstt-client
serv=r.rgntunnel.online
chave=784b9844675aa10467c1331d894933af0423f98f31554b1ef806d6a84e30ee3c
dns1=8.8.8.8
dns2=1.1.1.1
dns3=208.67.222.222
clear
Menu() {
    clear
    echo -e '\n'
    clear
#——————————————————                                     
# RGNET VPN                             
# VERSAO 2.0                                            
# SLOW DNS TUNNEL
#——————————————————                                     
RED='\033[1;31m'                                        GREEN='\033[1;32m'                                      YELLOW='\033[1;33m'                                     CORTITLE='\033[1;41m'                                   SCOLOR='\033[0m'
banner='                                                
 ___ _    _____      _____  _  _ ___
/ __| |  / _ \ \    / /   \| \| / __|
\__ \ |_| (_) \ \/\/ /| |) | .  \__ \
|___/____\___/ \_/\_/ |___/|_|\_|___/'

echo -e "${CORTITLE}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${CORTITLE}  SLOWDNS CLIENT     ${SCOLOR}"
echo -e "${CORTITLE}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${RED}$banner${SCOLOR}"
echo ""
     echo -e "${YELLOW}[ 1 ] | INSTALL SLOWDNS${SCOLOR}"
     echo -e "${RED}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
     echo -e "${YELLOW}[ 2 ] | SLOWDNS GOOGLE${SCOLOR}"
     echo -e "${YELLOW}[ 3 ] | SLOWDNS CLOUDFARE${SCOLOR}"
     echo -e "${YELLOW}[ 4 ] | SLOWDNS OPENDNS${SCOLOR}"
     echo -e "${RED}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
     echo -e "${YELLOW}[ 0 ] | SAIR${SCOLOR}"
    echo -e '\n'
     echo -e "${GREEN}DIGITE O NUMERO E APERTE ENTER: ${SCOLOR}"
    read opcao
    case $opcao in
    1) Opcao1 ;;
    2) Opcao2 ;;
    3) Opcao3 ;;
    4) Opcao4 ;;
    0) Sair ;;
    *) "Command unknown" ; echo ; Menu;;
    esac
    }

Opcao1 () {
clear
if [ -e $arquivo ]; then

echo -e "${CORTITLE}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${CORTITLE} SLOWDNS ALREADY INSTALLED                    ${SCOLOR}"
echo -e "${CORTITLE} TURN WIFI OR TURN MOBILE DATA ON  ${SCOLOR}"
echo -e "${CORTITLE} PRESS ENTER AND CHOOSE OPTIONS       ${SCOLOR}"
echo -e "${CORTITLE} FROM DNS AND THEN CONNECT TO VPN             ${SCOLOR}"
echo -e "${CORTITLE}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"

else
clear
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${CORTITLE}MENGINSTALL GIT... ${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
pkg install git -y > /dev/null 2>&1
echo -e "${CORTITLE}GIT TER-INSTALL${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${CORTITLE}DOWNLOADING GO...${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
pkg install golang -y > /dev/null 2>&1
echo -e "${CORTITLE}GO TER-DOWNLOAD${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
echo -e "${CORTITLE}DOWNLOADING DNSTT${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
git clone https://www.bamsoftware.com/git/dnstt.git > /dev/null 2>&1
echo -e "${CORTITLE}DNSTT TER-INSTALL${SCOLOR}"
echo -e "${GREEN}▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬${SCOLOR}"
touch ~/dnstt/dnstt-client/dns
echo "#!/bin/sh" >> ~/dnstt/dnstt-client/dns
echo "go build"  >> ~/dnstt/dnstt-client/dns
chmod  777 ~/dnstt/dnstt-client/dns
cd ~/dnstt/dnstt-client&&./dns /dev/null 2>&1&&mv dnstt-client ~
touch ~/server.pub
echo  > ~/server.pub
echo "$chave" >> ~/server.pub
touch ~/dns1
touch ~/dns2
touch ~/dns3
echo  > ~/dns1
echo  > ~/dns2
echo  > ~/dns3
echo "#!/bin/bash" >> ~/dns1
echo "#!/bin/bash" >> ~/dns2
echo "#!/bin/bash" >> ~/dns3
echo "./dnstt-client -udp $dns1:53   -pubkey $chave $serv 127.0.0.1:2222 > /dev/null 2>&1" >> ~/dns1
echo "./dnstt-client -udp $dns2:53   -pubkey $chave $serv 127.0.0.1:2222" > /dev/null 2>&1 >> ~/dns2
echo "./dnstt-client -udp $dns3:53   -pubkey $chave $serv 127.0.0.1:2222" > /dev/null 2>&1 >> ~/dns3
chmod 777 ~/dns1
chmod 777 ~/dns2
chmod 777 ~/dns3
rm ~/dnstt/dnstt-client/dns > /dev/null 2>&1
rm ~/dnstt/dnstt-client > /dev/null 2>&1
    yes| termux-setup-storage > /dev/null 2>&1
    cd $HOME
    cp ~/slowdns $PREFIX/bin/slowdns
    chmod +x $PREFIX/bin/slowdns
    [[ $(grep -c 'slowdns' $PREFIX/etc/profile) == '0' ]] && echo 'slowdns' >> $PREFIX/etc/profile
clear

echo -e "${CORTITLE}=========================================${SCOLOR}"
echo -e "${CORTITLE} SLOWDNS ALREADY INSTALLED                    ${SCOLOR}"
echo -e "${CORTITLE} TURN WIFI OR TURN MOBILE DATA ON  ${SCOLOR}"
echo -e "${CORTITLE} PRESS ENTER AND CHOOSE OPTIONS       ${SCOLOR}"
echo -e "${CORTITLE} FROM DNS AND THEN CONNECT TO VPN             ${SCOLOR}"
echo -e "${CORTITLE}=========================================${SCOLOR}"
fi
echo -e "${GREEN}=========================================${SCOLOR}"
echo -e "${YELLOW} PRESS ENTER TO BACK${SCOLOR}"
echo -e "${GREEN}=========================================${SCOLOR}"
   
    read opcao
    case 1 in
    1) Voltar ;;
    0) Sair ;;
    *) "unknown command" ; echo ; Opcao1 ;;
    esac
}

Opcao2 () {
clear
sh $HOME/dns1 &>/dev/null &
    clear
   banner='                                                
 ___ _    _____      _____  _  _ ___
/ __| |  / _ \ \    / /   \| \| / __|
\__ \ |_| (_) \ \/\/ /| |) | .  \__ \
|___/____\___/ \_/\_/ |___/|_|\_|___/'

echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${CORTITLE}        SLOWDNS CUSTOMER STARTED     ${SCOLOR}"
echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${RED}$banner${SCOLOR}"
echo ""
echo -e "\n${RED}[${GREEN}√${RED}]${SCOLOR} - ${GREEN}SLOWDNS STARTED!${SCOLOR} - ${RED}[${GREEN}√${RED}]\n\n${RED}[${YELLOW}!${RED}] ${YELLOW}NOW CONNECT TO A VPN APP\nOR CLICK TO ${GREEN}ENTER ${RED}TO DISCONNECT ${SCOLOR}"; read
piddns=$(ps x| grep -w 'dns' | grep -v 'grep'| awk -F' ' {'print $1'})
[[ ${piddns} != '' ]] && kill ${piddns} > /dev/null 2>&1
pkill dns
clear

}

Opcao3 () {
    clear
sh $HOME/dns2 &>/dev/null &
    clear
   banner='                                                
 ___ _    _____      _____  _  _ ___
/ __| |  / _ \ \    / /   \| \| / __|
\__ \ |_| (_) \ \/\/ /| |) | .  \__ \
|___/____\___/ \_/\_/ |___/|_|\_|___/'

echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${CORTITLE}        SLOWDNS CUSTOMER STARTED     ${SCOLOR}"
echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${RED}$banner${SCOLOR}"
echo ""
echo -e "\n${RED}[${GREEN}√${RED}]${SCOLOR} - ${GREEN}SLOWDNS STARTED!${SCOLOR} - ${RED}[${GREEN}√${RED}]\n\n${RED}[${YELLOW}!${RED}] ${YELLOW}NOW CONNECT TO A VPN APP\nOR CLICK TO ${GREEN}ENTER ${RED}TO DISCONNECT ${SCOLOR}"; read
piddns=$(ps x| grep -w 'dns' | grep -v 'grep'| awk -F' ' {'print $1'})
[[ ${piddns} != '' ]] && kill ${piddns} > /dev/null 2>&1
pkill dns
clear
}

Opcao4 () {
clear
sh $HOME/dns3 &>/dev/null &
    clear
   banner='                                                
 ___ _    _____      _____  _  _ ___
/ __| |  / _ \ \    / /   \| \| / __|
\__ \ |_| (_) \ \/\/ /| |) | .  \__ \
|___/____\___/ \_/\_/ |___/|_|\_|___/'

echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${CORTITLE}        SLOWDNS CUSTOMER STARTED     ${SCOLOR}"
echo -e "${CORTITLE}=====================================${SCOLOR}"
echo -e "${RED}$banner${SCOLOR}"
echo ""
echo -e "\n${RED}[${GREEN}√${RED}]${SCOLOR} - ${GREEN}SLOWDNS STARTED!${SCOLOR} - ${RED}[${GREEN}√${RED}]\n\n${RED}[${YELLOW}!${RED}] ${YELLOW}NOW CONNECT TO A VPN APP\nOR CLICK TO ${GREEN}ENTER ${RED}TO DISCONNECT ${SCOLOR}"; read
piddns=$(ps x| grep -w 'dns' | grep -v 'grep'| awk -F' ' {'print $1'})
[[ ${piddns} != '' ]] && kill ${piddns} > /dev/null 2>&1
pkill dns
clear
}

Voltar() {
clear
Menu
}

Sair() {
clear
exit
}
clear
Menu
