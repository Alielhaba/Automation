#!/bin/bash

# --------------------------------------------------------------------------------------------------------------
#change color to blue before printing
# Color variables
BOLD="\033[1m"
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'
# Background Color variables
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
# --------------------------------------------------------------------------------------------------------------
<<comment
---------------------------
Fonts:_
---------------------------
banner
big
block
bubble
digital
ivrit
lean
mini
mnemonic
script
shadow
slant
small
smscript
smshadow
smslant
standard
term
comment


{
for ((i=0 ; i<=100 ; i+=5));
do 
    sleep 0.1
    echo $i

done
} | whiptail  --gauge "Loading Requirments Script !" 6 50 0
# --------------------------------------------------------------------------------------------------------------

#sudo apt-get update -y
#sudo apt-get install figlet -y 
#sudo apt-get install whiptail -y

# --------------------------------------------------------------------------------------------------------------

echo "                                                                                                                       "
echo -e "${blue}-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------${clear}"
echo -e "${blue}-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------${clear}"
figlet -ctf small " EAZY MOBILITY "
echo -e "${blue}-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------${clear}"
echo -e "${blue}-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------${clear}"
echo -e "                                                                                                                                                                          ${yellow} Devops Team ${clear}"



echo -e "${red}-- Choose what you want to install . \n ${clear}"
re_choose_from_main_list_fun () {
echo -e "${yellow}Hint : Choose only Number from the following list \n\n${clear}"
	echo -e "${cyan}1) Docker ${clear}"
	echo -e "${cyan}2) Docker Compose ${clear}"
	echo -e "${cyan}3) Nginx ${clear}"
	echo -e "${cyan}4) Poratiner ${clear}"
	echo -e "${cyan}5) Quit ${clear}"
}




installation-option() {
echo -e "${magenta}Hint : Choose only Number from the following list \n\n${clear}"
select choice in "Docker" "Docker Compose" "Nginx" "Portainer" "Quit"
   do
	echo -e "${green}$choice ${clear}"
	case $choice in 
		"Docker" )
            		# Update the apt package index
			sudo apt-get update

			# Install packages to allow apt to use a repository over HTTPS:
			sudo apt-get install -y \
			    apt-transport-https \
			    ca-certificates \
			    curl \
			    gnupg-agent \
			    software-properties-common

			# Add Docker’s official GPG key:
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

			# Verify that the key with the fingerprint is 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88:
			sudo apt-key fingerprint 0EBFCD88

			# Set up the stable repository
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

			# Update the apt package index again
			sudo apt-get update

			# Install docker
			sudo apt-get install -y docker-ce docker-ce-cli containerd.io

			# Verify that Docker CE is installed correctly
			sudo docker run hello-world
			re_choose_from_main_list_fun

		;;
		"Docker Compose" )
            		sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
			sudo chmod +x /usr/local/bin/docker-compose
			docker-compose --version
			re_choose_from_main_list_fun

		;;
		"Nginx" )
             		# Update the package list
			sudo apt-get update

			# Install Nginx
			sudo apt-get install -y nginx

			# Start the Nginx service
			sudo systemctl start nginx

			# Enable Nginx to start at boot time
			sudo systemctl enable nginx

			# Check the status of the Nginx service
			sudo systemctl status nginx
			re_choose_from_main_list_fun

		;;
		
	        "Portainer" )
	               docker run -d -p 9000:9000 --name portainer \-v /var/run/docker.sock:/var/run/docker.sock \-v portainer_data:/data portainer/portainer-ce
                       re_choose_from_main_list_fun
               ;;
                "Quit" )
                       exit
               ;;
		     * )

			echo -e "${red}Entered Choice is not available${clear}"
            installation-option
	esac
   done 
}

installation-option
