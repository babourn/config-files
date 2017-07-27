#!/bin/bash
basedir=$PWD
vimdir=$HOME/.vim
vimfile=$HOME/.vimrc

echo "Update All Current Yum Packages"
sudo yum -y update

echo "Installing dependencies"
packages=( "ncurses-devel" "automake" "cmake" "python-devel" "python34-devel" "llvm" )

for i in ${packages[@]}; do
    echo "checking $i"
    if ! rpm -qa |grep -qw $i ; then
        sudo yum -y install $i
    fi
done


#Centos Doesn't seem to have an easy repo for vim 8.0 so just compile it
echo "Install Vim 8"
if  ! vim --version | grep -qw "Vi IMproved 8" ; then
    if [ ! -d $HOME/git ]; then
        mkdir $HOME/git
    fi
    cd $HOME/git
    git clone https://github.com/vim/vim.git
    cd vim/src/
    ./configure
    make
    sudo make install
    cd $basedir
fi

echo "download powerline fonts"
# clone
if [  ! -d $basedir/fonts ]; then
    git clone https://github.com/powerline/fonts.git
    ln -s ./fonts $HOME/.fonts
else
    cd fonts
    git pull
fi

echo "update font cache"
fc-cache $HOME/.fonts


echo "Setting up Vundle"
if [ ! -d "$vimdir/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

#------------------------------------------------------------------------------
echo "compiling YouCompleteMe"


#clangversion="llvm"  # Default: download from llvm.org
#clangversion="local" #Uncomment this line if you wanna use or local version
cd $vimdir/bundle/YouCompleteMe

if [ "$clangversion" = "llvm" ]; then
    ./install.py --clang-completer
elif [ "$clangversion" = "local" ]; then
    # We use the clang already installed on the system
    ./install.py --clang-completer --system-libclang
else
    echo "  Error: Invalid option to compile YouCompleteMe Clang completion support"
fi

#------------------------------------------------------------------------------
echo "setup git"
git config --global user.name "Brian Bourn"
git config --global user.email ba.bourn@gmail.com
git config --global alias.st status
git config --global core.editor vim
git config --global push.default simple
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
