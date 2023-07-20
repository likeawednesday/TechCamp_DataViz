#!/bin/bash

# Reset
Reset='\033[0m' # Text Reset

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;37m'  # White

# High Intensity
IBlack='\033[0;90m'  # Black
IRed='\033[0;91m'    # Red
IGreen='\033[0;92m'  # Green
IYellow='\033[0;93m' # Yellow
IBlue='\033[0;94m'   # Blue
IPurple='\033[0;95m' # Purple
ICyan='\033[0;96m'   # Cyan
IWhite='\033[0;97m'  # White

# Bold
BBlack='\033[1;30m'  # Black
BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'   # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'   # Cyan
BWhite='\033[1;37m'  # White

# Underline
UBlack='\033[4;30m'  # Black
URed='\033[4;31m'    # Red
UGreen='\033[4;32m'  # Green
UYellow='\033[4;33m' # Yellow
UBlue='\033[4;34m'   # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'   # Cyan
UWhite='\033[4;37m'  # White

# Background
On_Black='\033[40m'  # Black
On_Red='\033[41m'    # Red
On_Green='\033[42m'  # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'   # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'   # Cyan
On_White='\033[47m'  # White

spin='-\|/'

clear

printf "\n${White}${On_Purple}########################################################\nWelcome to Data Analysis and Visualization at Tech Camp!\n########################################################${Reset}\n"
printf "\n${Cyan}Press any key to continue...${Reset}\n"
read -n 1 -s -r

printf "\n${White}${On_Blue}Installing software packages for ${IPurple}${On_Blue}Python${White}${On_Blue}, ${IPurple}${On_Blue}Git${White}${On_Blue}, and their dependencies...${Reset}\n"
sudo apt update &
pid=$!
i=0
while kill -0 $pid 2>/dev/null; do
	i=$(((i + 1) % 4))
	printf "\r${spin:$i:1}"
	sleep .1
done
sudo apt -yqq install python3 python3-pip git &
pid=$!
i=0
while kill -0 $pid 2>/dev/null; do
	i=$(((i + 1) % 4))
	printf "\r${spin:$i:1}"
	sleep .1
done

printf "\n${White}${On_Blue}Adding ${On_Green}$HOME/.local/bin${On_Blue} (location where Jupyter is installed) to PATH environment variable for ${On_Green}$USER${On_Blue} (current user)...${Reset}\n"
echo -e '\n# set PATH so it includes user private bin if it exists\nif [ -d "$HOME/.local/bin" ] ; then\n    PATH="$HOME/.local/bin:$PATH"\nfi' >>~/.profile

source ~/.profile

printf "\n${White}${On_Blue}Installing ${IPurple}${On_Blue}Jupyter${White}${On_Blue}, ${IPurple}${On_Blue}JupyterLab${White}${On_Blue}, ${IPurple}${On_Blue}Matplotlib${White}${On_Blue}, ${IPurple}${On_Blue}NumPy${White}${On_Blue}, ${IPurple}${On_Blue}Pandas${White}${On_Blue}, ${IPurple}${On_Blue}Seaborn${White}${On_Blue}, and ${IPurple}${On_Blue}Squarify${White}${On_Blue} (Python apps and libraries made for Data Analysis and Visualization)...${Reset}\n"
pip install jupyter jupyterlab matplotlib numpy pandas seaborn squarify --no-warn-script-location 2>&1 >/dev/null &
pid=$!
i=0
while kill -0 $pid 2>/dev/null; do
	i=$(((i + 1) % 4))
	printf "\r${spin:$i:1}"
	sleep .1
done

printf "\n${White}${On_Blue}Cloning ${On_Green}TechCamp_DataViz${On_Blue} repository...\n  From: ${On_Green}https://GitHub.com/likeawednesday/TechCamp_DataViz${On_Blue}\n  To: ${On_Green}$HOME/TechCamp_DataViz${Reset}\n"
git clone --quiet --depth 1 https://github.com/likeawednesday/TechCamp_DataViz.git ~/TechCamp_DataViz 2>&1 >/dev/null &
pid=$!
i=0
while kill -0 $pid 2>/dev/null; do
	i=$(((i + 1) % 4))
	printf "\r${spin:$i:1}"
	sleep .1
done

printf "\n${White}${On_Blue}Setting execution permission on ${On_Green}$HOME/TechCamp_DataViz/lab/run_jupyterlab.sh${On_Blue} script file...${Reset}\n"
chmod +x ~/TechCamp_DataViz/lab/run_jupyterlab.sh

printf "\n${White}${On_Purple}######################\nInstallation complete!\n######################${Reset}\n"

printf "\n${Cyan}---------- Run JupyterLab now? (Y/N) ----------${Reset}\n"
read -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	~/TechCamp_DataViz/lab/run_jupyterlab.sh
fi
