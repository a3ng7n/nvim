# what

bootstrap
```
# shell
sudo apt install zsh
chsh -s $(which zsh)
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh-vi-mode

# misc
sudo apt install curl gnupg2

# fonts
mkdir -p ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
fc-cache -fv

# term
sudo apt install kitty

# python dev
sudo apt install python3.12-venv

# neovim
sudo apt install make gcc ripgrep unzip git xclip fd-find luarocks
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# dev
sudo apt install g++ autoconf libtool
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# reload terminal...
nvm install 19.6.1
```
