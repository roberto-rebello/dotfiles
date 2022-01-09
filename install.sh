mkdir -p $HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH

### Telegram Desktop
wget -o /tmp/wget_telegram.log -O /tmp/telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xf /tmp/telegram.tar.xz -C $HOME/Documents
ln -fs $HOME/Documents/Telegram/Telegram $HOME/.local/bin/telegram

### Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
rm signal-desktop-keyring.gpg

### Spotify
sudo apt-get install -y curl
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update && sudo apt-get install -y htop vim git tmux meld discord signal-desktop spotify-client steam make gcc
sudo apt-get install -y i3 i3blocks feh playerctl lm-sensors

### i3blocks scritps
git clone https://github.com/vivien/i3blocks-contrib.git
sudo cp mediaplayer/mediaplayer /usr/share/i3blocks
sudo cp volume-pulseaudio/volume-pulseaudio /usr/share/i3blocks/
rm -rf i3blocks-contrib

### betterlockscreen
## i3lock-color
sudo apt-get install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh
./install-i3lock-color.sh
cd -
rm -rf i3lock-color

## Image Magic
mkdir -p $HOME/Documents/ImageMagick
wget https://download.imagemagick.org/ImageMagick/download/binaries/magick -O $HOME/Documents/ImageMagick/magick
sudo ln -s $HOME/Documents/ImageMagick/magik /usr/local/bin/convert
git clone https://github.com/betterlockscreen/betterlockscreen.git
cd betterlockscreen
sudo ./install.sh system
cd -
rm -rf betterlockscreen

cp -rv .atom/ .config/ .fonts/ .vimrc $HOME

betterlockscreen -u ~/.config/i3/wallpaper.jpg

