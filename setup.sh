#!/bin/bash
#
# WSL Ubuntu Dotfiles
# Font: https://github.com/samuelramox/wsl-setup
# Main install script

source ./scripts/utils.sh

# Add your data
echo_info "Add your data:"
nano ./scripts/user.sh
source ./scripts/user.sh

# Install applications
bash ./scripts/apps.sh

# Install dotfiles
bash ./scripts/dotfiles.sh

# Node.js and npm settings
bash ./scripts/npm.sh

# Generate SSH key
if [[ $SSH_EMAIL ]]; then
  bash ./scripts/ssh.sh
fi

# Create a directory for projects and development
echo_info "Creating developer directories in Home directory..."
mkdir ${HOME}/develop ${HOME}/develop
mkdir ${HOME}/repos ${HOME}/repos

# Cleanup cached downloads and remove the installation zip and folder
echo_info "Removing unnecessary files..."
sudo apt -y autoremove

# Finish
echo_success "Reboot and enjoy!"
