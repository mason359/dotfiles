#!/bin/bash
sleep 60

cp files/ssh_config ~/.ssh/config

sudo apt install zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
rm ~/.zshrc.pre-oh-my-zsh

sudo git clone https://github.com/zolrath/wemux.git /usr/local/share/wemux
sudo ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux
sudo cp files/wemux.conf /usr/local/etc/wemux.conf

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

mkdir -p ~/.vim/colors
cp files/monokai.vim ~/.vim/colors
mkdir -p ~/.vim/plugin
cp files/figlet.vim ~/.vim/plugin
cp files/vim-ripgrep.vim ~/.vim/plugin
cp files/my_config.vim ~/.vim_runtime
cp files/.vimrc ~
cp files/agnoster.zsh-theme ~/.oh-my-zsh/themes
source ~/.vimrc

curl -s https://gravyweb.eng.qumulo.com/build/latest/src/build/toolchain/bootstrap.sh | bash
# export PATH="/opt/qumulo/toolchain/bin:${PATH}"
cp files/.hgrc ~
ssh-keyscan -4 hg.eng.qumulo.com submit.eng.qumulo.com >> ~/.ssh/known_hosts
ssh-keyscan -4 hg submit >> ~/.ssh/known_hosts
hg clone --stream --config extensions.qumulo=! ssh://hg@hg.eng.qumulo.com/tools ~/tools
hg clone --stream --config extensions.qumulo=! ssh://hg@hg.eng.qumulo.com/src ~/src

sudo apt install nfs-common
sudo apt install cifs-utils

sudo mkdir -p /mnt/gravytrain/home
sudo mkdir -p /mnt/gravytrain/release
sudo mkdir -p /mnt/gravytrain/external_sources
sudo mkdir -p /mnt/gravytrain/support
sudo mkdir -p /mnt/gravytrain/build
cat files/fstab | sudo tee -a /etc/fstab
mount -a
