#!/bin/bash

# Reset
Reset='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

printf "${Green}${On_Purple)\n########################################\nWelcome to Data Analysis and Visualization at Tech Camp!\n########################################\n${Reset}"
printf "${Blue}\nPress any key to continue...\n${Reset}"
read -n 1 -s -r

printf "${Blue}\nInstalling software packages for Python, Git, and their dependencies...${Reset}"
sudo apt install python3 python3-pip git

printf "${Blue}\nInstalling Jupyter, JupyterLab, Matplotlib, NumPy, Pandas, Seaborn, and Squarify (Python apps and libraries made for Data Analysis and Visualization)...${Reset}"
pip install jupyter jupyterlab matplotlib numpy pandas seaborn squarify

printf "${Blue}\nAdding ${Purple}$HOME/.local/bin${Blue} (location where Jupyter is installed) to PATH environment variable for ${Purple}$USER${Blue} (current user)...${Reset}"
echo -e '\n# set PATH so it includes user private bin if it exists\nif [ -d "$HOME/.local/bin" ] ; then\n    PATH="$HOME/.local/bin:$PATH"\nfi' >> ~/.profile2

printf "${Blue}\nCloning ${Green}TechCamp_DataViz${Blue} repository...\n  From: ${Green}https://GitHub.com/likeawednesday/TechCamp_DataViz${Blue}\n  To: ${Purple}$HOME/TechCamp_DataViz${Reset}"
git clone https://github.com/likeawednesday/TechCamp_DataViz.git ~/TechCamp_DataViz2

printf "${Blue}\nSetting execution permission on ${Purple}$HOME/TechCamp_DataViz/run_jupyterlab.sh${Blue} script file...${Reset}"
chmod +x ~/TechCamp_DataViz2/run_jupyterlab.sh

printf "${Green}${On_Purple}\n#######################\nInstallation complete!\n#######################\n${Reset}"

printf "${Cyan}Run JupyterLab now? (Y/N)${Reset}"
read -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	~/TechCamp_DataViz2/run_jupyterlab.sh
fi
