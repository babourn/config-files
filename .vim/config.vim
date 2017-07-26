" Vim Options (no plugins involved)

"========
" General
"========

set nocompatible                   " no vi-compatibility
set autochdir                      " disabled because of vimshell plugin
set autowriteall                   " automatically save all buffers
set autoread                       " load file modified outside vim
set nobackup                       " no backup files, we have git :)
set nowritebackup
set noswapfile                     " no swap file
set backspace=indent,eol,start     " see :help bs
set helplang=de,en                 " help language
set history=200                    " command history
set printoptions=paper:a4          " printer options
set fileencodings=ucs-bom,utf-8    " Encodings
set spelllang=de,pt_br,en,es       " set your favorite language here
if has("browse")
	set browsedir=buffer           " defaults to the current file's directory
endif
set completeopt=menu               " menu completion options
set ttyfast                        " fast terminal connection
set hidden                         " don't discard buffers
set ttimeoutlen=50                 " timeout for a key sequence complete
set pastetoggle=<F2>               " enables paste mode

" Force utf-8. Fallback latin1. Always use unix file format
if has('multi_byte')
	if has('unix')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	elseif has('mac') || has('macunix')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	elseif has('win32') || has('win64')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=dos
		set fileformats=dos,unix
	else
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	endif
else
	set termencoding=latin1
	set encoding=latin1
endif

" centralize undo files
" the directory must be created manually
if has("persistent_undo")
	set undodir=~/.vim/.undodir
	set undofile
endif

"======
" sound
"======
set t_vb=                " disable the  annoyng visual and sound bell :)
set novisualbell         " no noise
set noerrorbells         " no noise

"=======================
" Text Formatting/Layout
"=======================

syntax enable       " syntax highlight on and keep your settings
set fo=tcrqn        " See Help (:help fo-table)
set ai              " autoindent
set si              " smartindent
set copyindent      " Copy the structure of the existing lines indent when autoindenting a new line
if exists("g:usertextwidth")
	let &textwidth=g:usertextwidth
endif

set cpoptions=BceF  " compatible options

" Here are the space and tabulator keys definition:
" tabs are for indenting and aligning code and data.
" spaces are for separating words in text and comments.
"
" https://en.wikipedia.org/wiki/Space_bar
" https://en.wikipedia.org/wiki/Tabulator_key
"
" Vim tabs configuration
"
" tabstop = Set tabstop to tell vim how many columns a tab counts for. This isx
"           the only command here that will affect how existing text displays.
"
" shiftwidth = Set shiftwidth to control how many columns text is indented
"              with the reindent operations (<< and >>) and automatic C-style
"              indentation.
" softtabstop = Set softtabstop to control how many columns vim uses when you
"               hit Tab in insert mode
if exists("g:indent")
	let &tabstop=g:indent
	let &softtabstop=g:indent
	let &shiftwidth=g:indent
else
	set tabstop=4          " tab spacing (settings below are to unify it)
	set softtabstop=4      " unify
	set shiftwidth=4       " unify
endif

if exists("g:indenttype")
	if g:indenttype ==? "tabs"
		setlocal noexpandtab
	elseif g:indenttype ==? "spaces"
		setlocal expandtab
	else
		setlocal noexpandtab
	endif
else
	setlocal noexpandtab
endif


"==========
" Searching
"==========
set hlsearch      " highlight search patern
set incsearch     " incremental search
set ignorecase
set smartcase     " Override the 'ignorecase' option if the
                  " search pattern contains upper case characters. Only used when
                  " the search pattern is typed and 'ignorecase' option is on

" wildmenu: ignore these extensions
set wildignore=*.o,*.obj,*.bak,*.exe,*~,*.aux,*.fls
if has('unix')
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
else
	set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
endif

"===================
" GUI/Visual Options
"===================
tab all                      " open a new tab instead of a new vim instance
set showcmd                  " show command in last line of screen
set laststatus=2             " statusline always visible
set shortmess=aToO           " see: help shortmess
set ruler                    " Show cursor line and column number position
set number                   " show line numbers
set scrolloff=2              " number of screen lines to keep above and below the cursor.
set splitright               " Always splits to the right and below
set splitbelow
set showbreak=↳              " Show the linebreak for a long line

if exists("g:usercolorscheme")
	execute 'colorscheme '. g:usercolorscheme
else
	colorscheme vimhut
endif
set noshowmode               " Don't show the mode, Powerline shows it
set showmatch                " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2              " Tenths of a second to show the matching parten
set equalalways
set ead=both                 " set in which direction 'equalalways' works (ver, hor, both)
set wildmenu                 " use autocompletion on command line
set cursorline               " sets cursor line highlight. cool :)
set display=uhex             " show unprintable characters hexadecimal
set listchars=tab:▸\ ,eol:¬

if has('mouse')
	set mouse=a              " enable mouse in all modes
	set mousehide            " hides the mouse while typing
endif

if has('gui_running')
	set guioptions=aAgi      " see: help guioptions
	set bg=dark

	if has('unix')
		if exists("g:guifont")
			let &guifont=g:guifont
		else
			set guifont=Monospace\ 9
		endif
	elseif has ('mac')
		set guifont=Monospace\ 9
	elseif has ('win32') || ('win64')
		if exists("g:winguifont")
			let &guifont=g:winguifont
		else
			set guifont=Lucida_Sans_Typewriter:h9
		endif
	endif

	set mousemodel=popup
else
	set bg=light
	" Enable 256 colors in terminal
	if &term == 'xterm' || &term == 'screen' || &term =='terminator' || &term == 'gnome-terminal'
		set t_Co=256
	endif
endif
