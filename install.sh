mkdir -p $HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH

# Telegram Desktop
wget -o /tmp/wget_telegram.log -O /tmp/telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xf /tmp/telegram.tar.xz -C $HOME/Documents
ln -fs $HOME/Documents/Telegram/Telegram $HOME/.local/bin/telegram

# Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
rm signal-desktop-keyring.gpg

# Spotify
sudo apt-get install -y curl
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update && sudo apt-get install -y i3 feh playerctl htop vim git tmux meld discord signal-desktop spotify-client steam

cp -rv .atom/ .config/ .fonts/ .vimrc $HOME
