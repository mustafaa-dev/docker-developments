#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Load NVM in Zsh and install the latest Node.js
echo "Loading NVM and adding to .zshrc..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add NVM to .zshrc
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zshrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"" >> ~/.zshrc
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && . \"\$NVM_DIR/bash_completion\"" >> ~/.zshrc
source ~/.zshrc

# Install the latest Node.js version using NVM
echo "Installing the latest Node.js version..."
nvm install node

# Verify Node.js installation
echo "Verifying Node.js installation..."
node -v
npm -v

echo "NVM and the latest Node.js version installation complete!"
