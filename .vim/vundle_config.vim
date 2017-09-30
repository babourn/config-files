set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let os = substitute(system('uname -n'), "\n", "", "")
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
if os != "raspberrypi"
    Plugin 'Valloric/YouCompleteMe', {'rtp': 'plugin/'}
endif
Plugin 'https://github.com/Raimondi/delimitMate'

"  https://github.com/rafaelnp/rnpvim
Plugin    'https://github.com/vim-scripts/aftersyntaxc.vim'
Plugin    'https://github.com/vim-scripts/armasm'
Plugin    'https://github.com/sjl/badwolf'
Plugin    'https://github.com/itchyny/calendar.vim'
Plugin    'https://github.com/nielsmadan/harlequin'
Plugin    'https://github.com/sk1418/HowMuch'
Plugin    'https://github.com/tomasr/molokai'
Plugin    'https://github.com/scrooloose/nerdtree.git'
"Plugin    'https://github.com/myusuf3/numbers.vim'
Plugin    'https://github.com/oblitum/rainbow'
Plugin    'https://github.com/majutsushi/tagbar'
Plugin    'https://github.com/mbbill/undotree'
Plugin    'https://github.com/vim-airline/vim-airline'
Plugin    'https://github.com/vim-airline/vim-airline-themes'
Plugin    'https://github.com/jtratner/vim-flavored-markdown'
Plugin    'https://github.com/tpope/vim-git'
Plugin    'https://github.com/jamessan/vim-gnupg'
Plugin    'https://github.com/jistr/vim-nerdtree-tabs.git'
Plugin    'https://github.com/mhinz/vim-signify'
Plugin    'https://github.com/mhinz/vim-startify'
Plugin    'https://github.com/vim-syntastic/syntastic'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
