" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: aviala <aviala@student.42.fr>              +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/13 19:16:51 by aviala            #+#    #+#              "
"    Updated: 2014/01/19 14:47:47 by aviala           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Put your custom Vim configuration here
execute pathogen#infect()

" Better command completion
set wildmenu
set wildmode=list:longest

" Show current line
set ruler " Show the cursor position.
set cursorline

" Always use autoindent.
set autoindent

" Copy Paste with graphical environnement.
set clipboard=unnamed,unnamedplus

" Moar color is always better.
set t_Co=256

" Coloration syntaxique
syntax enable
colorscheme distinguished

" Active mouse support.
set mouse=a
" Show number of line
set number
set viminfo='20,\"50 " w and r in .viminfo. But dont save more than 50lines.
set history=50 " Save 50 file of command line history.
set colorcolumn=80 " Set limit at 80 column.

" Show matching parenthesis.
set showmatch 

" Tab stuff.
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab

" Persistent undo.
" set backupdir=~/.vim/backup
" set dir=~/.vim/undodir

" Unset arrow of death.
vnoremap <Up>  <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
inoremap <Up>  <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <right> <Nop>

" Adapt to the type of the file. -> '\t' instead of ' '.
autocmd FileType Makefile set noexpandtab
" set foldmethod=indent"

" map Q gq "Didn't use the Ex mod use Q for format , p in mode Visuel
" Remplace the text in the register.

" List unprintables characters.
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·


" Plugins stuff :
" NERNTree
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction
let NERDTreeIgnore = ['\.o$']

" Quickfixsign
set lazyredraw
let g:quickfixsigns_events = ['BufEnter', 'CursorHold', 'CursorMoved', 'InsertLeave', 'InsertChange']

" Syntastic stuff
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '★'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '>'
let g:syntastic_c_include_dirs = [ '.', '..', './includes', '../libopt/inc', './libft/includes', 'SDL2/include/SDL2' ]

" if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
" endif
