#!/bin/bash

sudo apt install vim tmux git curl network-manager network-manager-gnome xorg pulseaudio dmenu compton feh ranger unzip -y

# My config files
curl -o ~/.tmux.conf https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/.tmux.conf
curl -o ~/.vimrc https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/.vimrc

cd $HOME
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Fonts
sudo apt install fonts-roboto fonts-inconsolata -y
sudo mkdir -p /usr/share/fonts/truetype/ttf-monaco
cd /usr/share/fonts/truetype/ttf-monaco
sudo wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
sudo mkfontdir
cd ..
fc-cache

sudo chmod 1777 /opt/ && cd /opt/

# Gaps
# sudo apt install git libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev \
# libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
# libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev -y \
# && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps && autoreconf --force --install \
# && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers \
# && make && sudo make install

cd $HOME

if [ ! -d "Wallpapers" ]; then
	mkdir Wallpapers && cd Wallpapers
fi

# Background
curl -o wallpaper.png https://github.com/vickylai/i3-linux-config-tokyo-rice/raw/master/i3-asakusa-theme/asakusa.png

# Configure i3
mkdir -p ~/.config/{i3,i3status,compton}

curl -o ~/.config/i3/config https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/i3-config
mkdir ~/.config/i3status/config && curl -o ~/.config/i3status/config/i3status.conf \
https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/i3-status.conf

# Fun
sudo apt install gdb ltrace strace radare2 -y
git clone https://github.com/longld/peda.git /opt/peda
echo -e "set disassembly-flavor intel\nsource /opt/peda/peda.py" > ~/.gdbinit

# Bash case insensitive
echo "set completion-ignore-case on" > ~/.inputrc

# Bash profile
curl -o ~/.bashrc https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/.bashrc

# Colors of urxvt
curl -o ~/.Xdefaults https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/.Xresources

# Compton
curl -o ~/.config/compton.conf https://raw.githubusercontent.com/0xlantog/terminal-tools-settings/master/compton.conf

#cd /tmp && wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.7.2/fontawesome-free-5.7.2-web.zip
#unzip fontawesome-free-5.7.2-web.zip && cd fontawesome-free-5.7.2-web/webfonts
#mkdir $HOME/.fonts && cp *.ttf $HOME/.fonts

cd $HOME
