#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Fetch the latest Go version dynamically
echo "Fetching the latest Go version..."
GO_LATEST=$(curl -s https://go.dev/VERSION?m=text)

# Download the latest Go version
echo "Downloading Go $GO_LATEST..."
wget https://go.dev/dl/$GO_LATEST.linux-amd64.tar.gz

# Remove any previous Go installations
echo "Removing previous Go installation..."
sudo rm -rf /usr/local/go

# Extract and move Go to /usr/local
echo "Extracting Go and moving to /usr/local..."
sudo tar -C /usr/local -xzf $GO_LATEST.linux-amd64.tar.gz

# Set up Go environment variables for Zsh
echo "Setting up Go environment variables in .zshrc..."
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
echo "export GOPATH=\$HOME/go" >> ~/.zshrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.zshrc
source ~/.zshrc

# Verify Go installation
echo "Verifying Go installation..."
go version

# Clean up
echo "Cleaning up installation files..."
rm $GO_LATEST.linux-amd64.tar.gz

echo "Go $GO_LATEST installation complete!"
