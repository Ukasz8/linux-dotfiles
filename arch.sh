#!/bin/bash
#PACZKI
sudo pacman -S tldr steam openvpn neovim ufw flatpak htop zsh thunar p7zip fail2ban clamav gdb

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

#OH-MY-ZSH
echo 'N' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#THEME
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#PLUGINS
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


rm -rf ~/.p10k.zsh

mv .p10k.zsh ~

rm -rf ~/.zshrc

mv .zshrc ~

echo 'exec zsh' >> ~/.bashrc

mkdir ~/.fonts

mv ./MesloLGS_NF_Regular.ttf ~/.fonts/

rm -rf ~/.config/kglobalshortcutsrc

mv kglobalshortcutsrc ~/.config

#VPN

sudo mv vpn.conf /etc/openvpn/server/

sudo systemctl enable openvpn-server@vpn

sudo systemcl start openvpn-server@vpn
