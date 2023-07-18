#!/bin/bash
echo -e "########################################\nWelcome to Data Analysis and Visualization at Tech Camp!\n########################################"
echo -e "\nInstalling software packages for Python, Git, and their dependencies..."
sudo apt install python3 python3-pip git

echo -e "\nInstalling Jupyter, JupyterLab, Matplotlib, NumPy, Pandas, Seaborn, and Squarify (Python apps and libraries made for Data Analysis and Visualization)..."
pip install jupyter jupyterlab matplotlib numpy pandas seaborn squarify

echo -e "\nAdding \"$HOME/.local/bin\" (location where Jupyter is installed) to PATH environment variable for $USER (current user)..."
echo -e '\n# set PATH so it includes user private bin if it exists\nif [ -d "$HOME/.local/bin" ] ; then\n    PATH="$HOME/.local/bin:$PATH"\nfi' >> ~/.profile2

echo -e "\nCloning TechCamp_DataViz repository...\n  From: https://GitHub.com/likeawednesday/TechCamp_DataViz\n  To: $HOME/TechCamp_DataViz"
git clone https://github.com/likeawednesday/TechCamp_DataViz.git ~/TechCamp_DataViz2

echo -e "\nSetting execution permission on $HOME/TechCamp_DataViz/run_jupyterlab.sh script file..."
chmod +x ~/TechCamp_DataViz2/run_jupyterlab.sh

echo -e "\n####################\nInstallation complete!\n####################\n" 

read -p "Run JupyterLab now? (Y/N)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	~/TechCamp_DataViz2/run_jupyterlab.sh
fi
