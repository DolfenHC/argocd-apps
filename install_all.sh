#!/bin/sh
sudo apt update
sudo apt install git
git clone https://github.com/DolfenHC/argocd-apps.git
cd argocd-apps
chmod +x ./install_docker.sh
chmod +x ./install_k3d.sh
./install_docker.sh
./install_k3d.sh
