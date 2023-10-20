#!/bin/bash

# Update package lists
sudo apt update

# Install dependencies
sudo apt install -y curl wget gnupg2 software-properties-common

# Install Veracrypt
sudo add-apt-repository ppa:unit193/encryption -y
sudo apt update
sudo apt install -y veracrypt

# Install Proton Drive (Note: Proton Drive is not officially released for Linux, using CLI as an alternative)
wget https://github.com/ProtonMail/proton-bridge/releases/download/CLI-1.0.0/protonmail-bridge_1.0.0-1_amd64.deb
sudo dpkg -i protonmail-bridge_1.0.0-1_amd64.deb
rm protonmail-bridge_1.0.0-1_amd64.deb

# Install Kleopatra (GnuPG)
sudo apt install -y kleopatra

# Install Signal Beta
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor -o /usr/share/keyrings/signal-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-archive-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install -y signal-desktop-beta

# Install VirtualBox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo apt update
sudo apt install -y virtualbox-6.1

# Cleanup
sudo apt autoremove -y
sudo apt clean

echo "All software has been installed."

