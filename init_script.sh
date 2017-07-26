#!/bin/bash
basedir=$PWD
vimdir=$HOME/.vim
vimfile=$HOME/.vimrc

echo "Installing dependencies"
#NOTE: these might fail and may need to be run as root
if  ! rpm -qa | grep -qw automake; then
    sudo yum -y install automake
fi
if  ! rpm -qa | grep -qw cmake; then 
    sudo yum -y install cmake
fi
if  ! rpm -qa | grep -qw python-devel; then
    sudo yum -y install python-devel python3-devel
fi
if  ! rpm -qa | grep -qw llvm; then
    sudo yum -y install llvm
fi
echo "Setting up Vundle"
if [ ! -d "$vimdir/bundle/Vundle.vim" ]; then

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi
vim +PluginInstall +qall

#------------------------------------------------------------------------------
echo "compiling YouCompleteMe"


clangversion="llvm"  # Default: download from llvm.org
#clangversion="local" #Uncomment this line if you wanna use or local version
cd $vimdir/bundle/YouCompleteMe

if [ "$clangversion" = "llvm" ]; then
    #./install.sh --clang-completer
elif [ "$clangversion" = "local" ]; then
    # We use the clang already installed on the system
    ./install.py --clang-completer --system-libclang
else
    echo "  Error: Invalid option to compile YouCompleteMe Clang completion support"
fi

#------------------------------------------------------------------------------
echo "setup git"

git config --global push.default simple
