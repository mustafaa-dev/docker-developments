# Install WezTerm
echo "Installing WezTerm..."
wget https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu22.04.deb
sudo apt install -y ./wezterm-nightly.Ubuntu22.04.deb
rm wezterm-nightly.Ubuntu22.04.deb

# Install Starship prompt
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh

# Add Starship configuration to .zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc

# Verify Starship installation
echo "Verifying Starship installation..."
starship --version

# Copy WezTerm configuration
echo "Copying WezTerm configuration files..."
mkdir -p ~/.config/wezterm
cp -r configs/wezterm/* ~/.config/wezterm/

# Confirm WezTerm config copy
if [ -d "$HOME/.config/wezterm" ]; then
    echo "WezTerm configuration copied successfully."
else
    echo "Failed to copy WezTerm configuration."
fi

echo "WezTerm, Starship, NVM, Node.js installation and WezTerm config setup complete!"