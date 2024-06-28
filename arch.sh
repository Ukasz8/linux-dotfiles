#!/bin/bash
pacman -S tldr steam openvpn neovim git ufw flatpak p7zip-gui htop zsh thunar

yay -S  blackbox-terminal librewolf-bin fastfetch keepassxc

ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

systemctl enable fail2ban
systemctl start fail2ban

chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
