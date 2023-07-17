#!/bin/bash
sudo apt install python3 python3-pip dex
pip install jupyterlab matplotlib numpy pandas seaborn squarify
echo ". ./.profile;jupyter lab" >> ~/run_jupyterlab.sh
chmod +x ~/run_jupyterlab.sh
dex -c ~/run_jupyterlab.sh /usr/share/applications/JupyterLab

