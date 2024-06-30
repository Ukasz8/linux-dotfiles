#!/bin/bash
#UPDATE
yay 
#PACZKI
sudo pacman -S tldr steam openvpn neovim ufw flatpak htop zsh thunar p7zip fail2ban

yay -S  blackbox-terminal librewolf-bin fastfetch keepassxc

#FIREWALL
 
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

#THEME
echo 'N' | git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#PLUGINS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -rf ~/.p10k.zsh

mv .p10k.zsh ~

rm -rf ~/.zshrc

mv .zshrc ~

chsh -s /bin/zsh

#BLACKBOX
mkdir ~/.fonts

mv ./MesloLGS_NF_Regular.ttf ~/.fonts/
