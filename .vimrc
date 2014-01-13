" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: aviala <aviala@student.42.fr>              +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/13 19:16:51 by aviala            #+#    #+#              "
"    Updated: 2014/01/13 19:34:08 by aviala           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Put your custom Vim configuration here
execute pathogen#infect()

" Better command completion
set wildmenu
set wildmode=list:longest

" Show current line
set ruler " Show the cursor position.
set ai " Always use autoindent.


" Copy Paste with graphical environnement.
set clipboard=unnamed,unnamedplus

syntax enable
" Coloration syntaxique
colorscheme distinguished
set mouse=a
set nu " Show number of line
set viminfo='20,\"50 " w and r in .viminfo. But dont save more than 50lines.
set history=50 " Save 50 file of command line history.
set expandtab
set colorcolumn=80 " Set limit at 80 column.
set showmatch " Show matching parenthesis.

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
" autocmd FileType ?akefile set noexpandtab
" set foldmethod=indent"

" map Q gq "Didn't use the Ex mod use Q for format , p in mode Visuel
" Remplace the text in the register.

" List unprintables characters.
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

" Syntastic stuff
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '★'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '>'
let g:syntastic_c_include_dirs = [ '.', '..', '../inc', '../libft/inc', '../libopt/inc']

" if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
" endif
