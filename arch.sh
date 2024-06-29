#!/bin/bash
sudo pacman -S tldr steam openvpn neovim ufw flatpak htop zsh thunar

echo TEST
read tt

yay -S  blackbox-terminal librewolf-bin fastfetch keepassxc

sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

#chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
