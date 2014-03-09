"| 
"| File		: ~/.vimrc
"| Source 	: https://github.com/darnuria/my_dotfiles
"| Licence	: UNLICENCE
"|
"
let $VIMHOME = glob('~/.vim')         " user directory
let $VIMTEMP = glob('~/.vim/tmp')        " temp directory

" Don’t create temp files everywhere, but just in $VIMTEMP if it exists
if !empty($VIMTEMP)         " check that the directory exists
	set backupdir=$VIMTEMP         " backup files
	set directory=$VIMTEMP         " swap files
	set undodir =$VIMTEMP         " undo files
	set undofile         " persistent undo
endif

" Modern behaviour:
" Required for some top level options.
set nocompatible
" Active mouse selection
" set mouse=a

" Copy Paste with graphical environnement.
set clipboard=unnamed,unnamedplus

" two solutions to let CTRL-ZXCV behave like in Notepad:
" * the standard "mswin.vim" resource: source $VIMRUNTIME/mswin.vim
" * the "cua-mode.vim" plugin: https://github.com/fabi1cazenave/cua-mode.vim
" (the CUA mode, by default, preserves other Vim shortcuts much better)

" Eeverytime we change window, check if file has been updated outside of the
" editor.
autocmd WinEnter * checktime

"|=============================================================================
"| Plugins
"|=============================================================================

filetype off " required!

if filereadable($VIMHOME.'/plugins.vim')
	source $VIMHOME/plugins.vim
endif

filetype plugin indent on

"if exists("Ranger")
"	noremap <silent> <Esc>e :call Ranger()<CR>
"endif

"|
"| end : Plugins
"|

"|=============================================================================
"| Mappings
"|=============================================================================

" Disable digraph input to make <^> work faster.
set nodigraph

" Unset arrow of death.
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <right> <Nop>

"|=============================================================================
"| end : Mappings
"|=============================================================================

"|=============================================================================
"| Terminal <<<
"|=============================================================================

set shell=/bin/bash
set t_Co=256         " because all terms should support 256 colors nowadays…
set notitle         " don’t set the title to “Thanks for flying vim” on exit
set guipty         " better (?) terminal emulation in GUI mode

"|=============================================================================
"| end : Terminal
"|=============================================================================

"|=============================================================================
"| User Interface <<<
"|=============================================================================

set autoindent " Always use autoindent.

set showmode         " display current mode blow the status line
set showtabline=4         " show tabbar even for a single buffer
set laststatus=4         " always show the status line
set ruler         " display line/col position in the status line
set cursorline         " highlight current line
set splitbelow         " consistency with most tiling WMs (wmii, i3…)
set virtualedit=block         " easier rectangular selections

set number         " show absolute line numbers (:set nu)
"set relativenumber         " show relative line numbers (:set rnu)

set scrolloff=5         " number of screen lines to show around the cursor
set numberwidth=6         " minimal number width (not working?)

" minimal interface when running in GUI mode
" set guioptions=
" set guifont=Inconsolata\ 11

syntax on
colorscheme distinguished

" 80-character lines (= Mozilla guidelines)
set textwidth=80         " line length above which to break a line
set colorcolumn=+0         " highlight the textwidth limit
set nowrap
"set nowrapscan
set linebreak

autocmd FileType Makefile set noexpandtab
" set foldmethod=indent"

" map Q gq "Didn't use the Ex mod use Q for format , p in mode Visuel
" Remplace the text in the register.

" List unprintables characters.
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

" if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
" endif

" Set foldmethod=indent
autocmd FileType html,xhtml,javascript,css,c,cpp,python setlocal
"foldmethod=indent
"
"|=============================================================================
"| >>> User Interface
"|=============================================================================


"|=============================================================================
"| General settings <<<
"|=============================================================================

set encoding=utf-8
" Highligh blank characters.
set lcs=tab:\›\ ,trail:~,nbsp:¤,extends:>,precedes:<
" this should be the default but some distros disable modelines by default…
set modeline
set modelines=5

" Use the current file’s directory as Vim’s working directory
" set autochdir         " XXX not working on MacOSX

set showmatch         " when inserting a bracket, briefly jump to its match
" set filetype=vim         " trigger the FileType event when set (local to
" buffer)

set showcmd

" set syntax on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set cindent

set viminfo='20,\"50 " w and r in .viminfo. But dont save more than 50lines.
set history=50 " Save 50 file of command line history.
" 80-character lines (= Mozilla guidelines)

" search settings
set hlsearch         " highlight search results
set incsearch         " incremental search: find as you type
set ignorecase         " search is case-insensitive…
set smartcase         " … except if the search pattern contains uppercase chars

" case-insensitive tab completion
set wildmenu
set wildmode=longest:full
if exists("&wildignorecase")
	set wildignorecase
endif
set showfulltag

" disable incrementation of octal numbers
set nrformats=hex

" Adapt to the type of the file. -> '\t' instead of ' '.

" au BufReadPosa * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

