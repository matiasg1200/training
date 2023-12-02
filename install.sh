#!/bin/bash

# Install git
apt update 
apt install -y git

# Create dirs for tfevn and tgenv
mkdir .tfenv
mkdir .tgenv

# Clone tfenv and tgenv repos
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv

# Instll Oh my Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Repleace default theme - optional
current_theme=$(awk -F= '/^OSH_THEME/{print$2}' .bashrc)
sed -i 's/'$current_theme'/"agnoster"/g'


# Add tfenv and tgenv to PATH
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bashrc

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
