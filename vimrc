"|
"| File		: ~/.vimrc
"| Source 	: https://github.com/darnuria/my_dotfiles
"| Licence	: UNLICENCE
"|

"|=============================================================================
"| Indispensible Settings
"|=============================================================================
"
" User configuration directory.
let $VIMHOME = glob('~/.vim')
" Temporary files directory.
let $VIMTEMP = glob('~/.vim/tmp')

" Don’t create temp files everywhere, but just in $VIMTEMP if it exists
" Check that the directory exists.
if !empty($VIMTEMP)
    " backup files
    set backupdir=$VIMTEMP
    " swap files
    set directory=$VIMTEMP
    " undo files
    set undodir =$VIMTEMP
    " persistent undo
    set undofile
endif

" Because putting fancy characters like λ is awesome.
set encoding=utf-8

" Modern behaviour:
" Required for some top level options.
set nocompatible
" Active mouse selection
" set mouse=a

" Copy Paste with graphical environnement.
set clipboard=unnamed,unnamedplus

" Two solutions to let CTRL-ZXCV behave like in Notepad:
" * the "cua-mode.vim" plugin: https://github.com/fabi1cazenave/cua-mode.vim

" Everytime we change window, check if file has been updated outside of the editor.
autocmd WinEnter * checktime

"|=============================================================================
"| Mappings
"|=============================================================================

" Note: Disable digraph input to make <^> work faster.
set nodigraph

" Note: Unset arrow for moves in Visual-* mode.
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" Note: Unset arrow for moves in Insertion mode.
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <right> <Nop>

"|=============================================================================
"| Terminal
"|=============================================================================

" Note: Usefull if you use a non-Posix complient shell like fish.
set shell=/bin/bash
" Because all terms should support 256 colors nowadays…
set t_Co=256
" Don’t set the title to “Thanks for flying vim” on exit
set notitle
" Better (?) terminal emulation in GUI mode
set guipty

" Note: Configuration for interfacing with Ranger curses file explorer
"if exists("Ranger")
"	noremap <silent> <Esc>e :call Ranger()<CR>
"endif

"|=============================================================================
"| User Interface
"|=============================================================================

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
" Consistency with most tiling Windows Managers (wmii, i3…).
set splitbelow
" Easier rectangular selections.
set virtualedit=block

" Show absolute line numbers (:set nu).
set number
" show relative line numbers (:set rnu).
" set relativenumber

" Number of screen lines to show around the cursor.
set scrolloff=5
" Minimal number width (not working?).
set numberwidth=6

" 80-character lines.
" Line length above which to break a line.
set textwidth=80
" Highlight the textwidth limit.
set colorcolumn=+0
set wrap
"set nowrapscan
set linebreak
set showbreak=>\ \ \

" Folding settings:
set foldmethod=indent

" Didn't use the Ex mod use Q for format , p in mode Visuel
" map Q gq
" Remplace the text in the register.

" List unprintables characters.

set listchars=nbsp:¤,tab:··,trail:¤,extends:>,precedes:<
set list

" Decomment: If using a Graphical user interface.
if &t_Co > 2 && has("gui_running")
    set guioptions=
    set hlsearch
endif

" Note: Makefile needs tabs…
autocmd FileType Makefile set noexpandtab

" Missing: Documentation.
autocmd FileType html,xhtml,javascript,css,c,cpp,python setlocal

"|=============================================================================
"| General settings
"|=============================================================================


" Note: This should be the default but some distros disable modelines by default…
set modeline
set modelines=5

" Use the current file’s directory as Vim’s working directory.
" Note: Not working on MacOSX.
set autochdir

" When inserting a bracket, briefly jump to its match.
set showmatch

" Trigger the FileType event when set (local to buffer)
" set filetype=vim

" Missing: Documentation.
set showcmd

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set cindent
"
" w and r in .viminfo. But dont save more than 50lines.
set viminfo='20,\"50
" Save 50 file of command line history.
set history=50

" Search settings.
" Highlight search results.
set hlsearch
" Incremental search: find as you type.
set incsearch
" Search is case-insensitive.
set ignorecase
" Except if the search pattern contains uppercase chars.
set smartcase

" Case-insensitive tab completion.
" Enhanced command-line completion in the status line
set wildmenu
" use `list:longest` to complete files like a (missing part?).
set wildmode=longest:full
if exists("&wildignorecase")
    set wildignorecase
endif

" Missing: Documentation.
set showfulltag

" Disable incrementation of octal numbers.
set nrformats=hex

" Strip trailing whitespace.
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let last_search=@/
    " Saving: current line.
    let current_line = line(".")
    " Saving: current column.
    let current_column = col(".")
    " Replace: all traillings spaces by nothing.
    %s/\s\+$//e
    " Clean: restore previous search history, and cursor position.
    let @/=last_search
    call cursor(current_line, current_column)
endfunction " StripTrailingWhitespaces
"
" Call on save.
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Note: Neccessary for vim-airline
set laststatus=2

" Resolving: Vim: Warning: Input is not from a terminal
au StdinReadPost * set buftype=nofile

"|=============================================================================
"| Plugins
"|=============================================================================

" Enabling syntax highlighting.
syntax enable
" Setting vim background to black manually.
set background=dark

" Looking for plugin file script.
if filereadable($VIMHOME.'/plugins.vim')
    source $VIMHOME/plugins.vim
else
    echo "Error!"
endif

" Colorscheme downloaded through Neobundle.
colorscheme distinguished

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
