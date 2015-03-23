" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"Brian's Vim Settings



"Line numbers
set number


" Buffer switching using Cmd-arrows in Mac and Alt-arrows in Linux
 :nnoremap <D-Right> :bnext<CR>
 :nnoremap <M-Right> :bnext<CR>
 :nnoremap <D-Left> :bprevious<CR>
 :nnoremap <M-Left> :bprevious<CR>
 " and don't let MacVim remap them
 if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
    endif

"auto-indent 4 spaces
set shiftwidth=4

"expand tab into spaces except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

"for just text files
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76

"prepend ~/.backup to backupdir so that vim will look there before
"littering current dir with backups
""mkdir ~/.backup" for this to work
set backupdir^=~/.backup

"also use ~/.bakcup for swap files trailling // tells Vim to incorporate
"full path into swap file names
set dir^=~/.backup//

"end Brians Vim settings

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif
