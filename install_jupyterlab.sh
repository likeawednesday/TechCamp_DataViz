#!/bin/bash
sudo apt install python3 python3-pip
pip install jupyterlab matplotlib numpy pandas seaborn squarify
echo -e '\n# set PATH so it includes user private bin if it exists\nif [ -d "$HOME/.local/bin" ] ; then\n    PATH="$HOME/.local/bin:$PATH"\nfi' >> ~/.profile
echo ". ./.profile;jupyter lab" >> ~/run_jupyterlab.sh
chmod +x ~/run_jupyterlab.sh
~/run_jupyterlab.sh
