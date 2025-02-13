apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zolrath/wemux.git /usr/local/share/wemux
ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux
cp wemux.conf /usr/local/etc/wemux.conf

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors
mkdir -p ~/.vim/plugin
cp figlet.vim ~/.vim/plugin
cp vim-ripgrep.vim ~/.vim/plugin
cp my_config.vim ~/.vim_runtime
cp .vimrc ~
cp agnoster.zsh-theme .oh-my-zsh/themes

curl -s https://gravyweb.eng.qumulo.com/build/latest/src/build/toolchain/bootstrap.sh | bash
.hgrc
ssh-keyscan -4 hg.eng.qumulo.com submit.eng.qumulo.com >> ~/.ssh/known_hosts
ssh-keyscan -4 hg submit >> ~/.ssh/known_hosts
hg clone --stream --config extensions.qumulo=! ssh://hg@hg.eng.qumulo.com/tools
hg clone --stream --config extensions.qumulo=! ssh://hg@hg.eng.qumulo.com/src
./prebuild

sudo apt install nfs-common
sudo apt install cifs-utils

cat ./fstab >> /etc/fstab
mount -a
