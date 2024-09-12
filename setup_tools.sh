#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo apt-get install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update -y
sudo apt-get install -y code

# Install JetBrains Toolbox (for WebStorm and DataGrip)
echo "Installing JetBrains Toolbox..."
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz -O jetbrains-toolbox.tar.gz
tar -xvzf jetbrains-toolbox.tar.gz
cd jetbrains-toolbox-*/ || exit
./jetbrains-toolbox

# Install Postman
echo "Installing Postman..."
sudo snap install postman

# Install Brunu HTTP Client
echo "Installing Brunu HTTP Client..."
wget https://github.com/brunohbrito/brunu-http/releases/download/v1.0.3/brunu-linux -O brunu
chmod +x brunu
sudo mv brunu /usr/local/bin/

echo "Installation of NVM, Node.js, VSCode, WebStorm, DataGrip, Postman, and Brunu HTTP client is complete!"
