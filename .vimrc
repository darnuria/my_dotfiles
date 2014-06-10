"|
"| File		: ~/.vimrc
"| Source 	: https://github.com/darnuria/my_dotfiles
"| Licence	: UNLICENCE
"|

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
"
" Always use autoindent.
set autoindent
" Display current mode blow the status line.
set showmode
" Show tabbar even for a single buffer.
set showtabline=4
" Always show the status line.
set laststatus=4
" Display line/col position in the status line.
set ruler
" Highlight current line.
set cursorline
" Consistency with most tiling WMs (wmii, i3…).
set splitbelow
" Easier rectangular selections.
set virtualedit=block
"
" Show absolute line numbers (:set nu).
set number
" show relative line numbers (:set rnu).
"set relativenumber

" Number of screen lines to show around the cursor.
set scrolloff=5
" Minimal number width (not working?).
set numberwidth=6

" Minimal interface when running in GUI mode.
" set guioptions=
" set guifont=Inconsolata\ 11

syntax on
colorscheme distinguished

" 80-character lines (= Mozilla guidelines).
" Line length above which to break a line.
set textwidth=80
" Highlight the textwidth limit.
set colorcolumn=+0
set wrap
"set nowrapscan
set linebreak
set showbreak=>\ \ \

autocmd FileType Makefile set noexpandtab
" set foldmethod=indent"

" map Q gq "Didn't use the Ex mod use Q for format , p in mode Visuel
" Remplace the text in the register.

" List unprintables characters.
set listchars=tab:▸.,eol:¬,trail:·,nbsp:·

" if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
" endif

" set foldmethod=indent
autocmd FileType html,xhtml,javascript,css,c,cpp,python setlocal
"
"|=============================================================================
"| >>> User Interface
"|=============================================================================


"|=============================================================================
"| General settings <<<
"|=============================================================================

set encoding=utf-8
" Highligh blank characters.
"set lcs=tab:\›\ ,trail:~,nbsp:¤,extends:>,precedes:<
" this should be the default but some distros disable modelines by default…
set modeline
set modelines=5

" Use the current file’s directory as Vim’s working directory.
" set autochdir         " XXX not working on MacOSX

" When inserting a bracket, briefly jump to its match.
set showmatch
" Trigger the FileType event when set (local to buffer)
" set filetype=vim

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
" 80-character lines (= Mozilla guidelines).

" Search settings.
set hlsearch         " Highlight search results.
set incsearch         " Incremental search: find as you type.
set ignorecase         " Search is case-insensitive.
set smartcase         " Except if the search pattern contains uppercase chars.

" Case-insensitive tab completion.
set wildmenu
set wildmode=longest:full

if exists("&wildignorecase")
	set wildignorecase
endif

set showfulltag

" Disable incrementation of octal numbers.
set nrformats=hex

" Strip trailing whitespace.
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position..
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean: restore previous search history, and cursor position.
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


"| for vim-airline
set laststatus=2
