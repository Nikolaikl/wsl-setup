#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./scripts/utils.sh

echo_info "Installing apps..."

# Update Ubuntu
sudo apt update && sudo apt upgrade -y

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install -y ubuntu-wsl

# Essential package
sudo apt install -y build-essential gcc

# Common packages
sudo apt install -y apt-transport-https ca-certificates curl gawk ssh-askpass tree unzip wget zsh

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update && sudo apt install -y git

# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs yarn

# Rust

curl https://sh.rustup.rs -sSf | sh

# Go

sudo snap install go --classic

# tree
sudo apt-get install tree -y

# bat
sudo apt install bat -y

# Glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
sudo apt install 

# GH 

(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "/Users/$whoami/.sdkman/bin/sdkman-init.sh"

# Docker

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# fzf
sudo apt install fzf -y

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb

# lazygit

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit

# deadsnake python repo
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update

# tree sitter
cargo install tree-sitter-cli

# viu cli tool
cargo install viu

# bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb
sudo dpkg -i bottom_0.10.2-1_amd64.deb

rm bottom_0.10.2-1_amd64.deb

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Finish
echo_success "Finished applications installation."
