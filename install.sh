#!/bin/bash

#####################################################
# Script only for setting up a customized local env #
# Installs:                                         #
# - docker                                          #
# - git                                             #
# - tfenv                                           #
# - tgenv                                           #
# - Oh my bash                                      #
# Add your user to sudoers before running           #
#####################################################

###############################################################
# TO FIX:                                                     #
# - remove tfenv and tgenv from PATH                          #
# - add symlink instead: ln -s ~/.tfenv/bin/* /usr/local/bin  #
###############################################################

# Install git & curl
sudo apt update 
sudo apt install -y git
sudo apt install -y curl

# Create dirs for tfevn and tgenv
mkdir .tfenv
mkdir .tgenv

# Clone tfenv and tgenv repos
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv

# Add tfenv and tgenv to PATH
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bashrc

# Instll Oh my Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Repleace default theme - optional
current_theme=$(awk -F= '/^OSH_THEME/{print$2}' ~/.bashrc)
sed -i 's/'$current_theme'/"agnoster"/g' ~/.bashrc

# Install Powerline fonts
sudo apt-get install -y fonts-powerline

# Source updated Bash profile
source .bashrc

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install kubectl 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
