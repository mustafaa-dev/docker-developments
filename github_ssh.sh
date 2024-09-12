#!/bin/bash

# Define file and key variables
KEY_NAME="github_rsa"
KEY_PATH="$HOME/.ssh/$KEY_NAME"
PUBLIC_KEY_PATH="$KEY_PATH.pub"

# Check if SSH key already exists
if [ -f "$PUBLIC_KEY_PATH" ]; then
    echo "SSH key already exists at $PUBLIC_KEY_PATH."
    echo "If you want to generate a new key, please remove the existing key or choose a different key name."
    exit 1
fi

# Generate new SSH key
echo "Generating new SSH key..."
ssh-keygen -t rsa -b 4096 -C "mostafa.mohammed1235@gmail.com" -f "$KEY_PATH" -N ""

# Add the SSH key to the ssh-agent
echo "Adding SSH key to ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

# Copy the SSH public key to the clipboard
if command -v xclip > /dev/null; then
    echo "Copying SSH public key to clipboard..."
    xclip -sel clip < "$PUBLIC_KEY_PATH"
    echo "SSH key copied to clipboard."
else
    echo "xclip not found. Please install xclip to copy the SSH key to clipboard."
    echo "You can install it with: sudo apt-get install xclip"
fi

# Display the SSH key and instructions for GitHub
echo "Setup complete! Your new SSH key is ready for use."
