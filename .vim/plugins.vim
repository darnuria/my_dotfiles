"|
"| File 	: ~/.vim/plugins.vim
"| Source 	: https://github.com/darnuria/my_dotFiles
"| Licence 	: UNLICENCE
"|

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    " Be iMproved
    set nocompatible

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"|
"| nerdcommenter
"|

"let g:NERDSpaceDelims = 1
" let g:NERDCustomDelimiters = {
" \ 'javascript': { 'left': '//~ ', 'leftAlt': '/**', 'rightAlt': '*/'}
" \ }
" NeoBundle 'scrooloose/nerdcommenter'

"|
"| Syntastics
"|

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_error_symbol = '★'
let g:syntastic_style_error_symbol = '@'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '#'
let g:syntastic_c_include_dirs = [ '.', '..', './includes', '../libopt/inc', '../*/includes', 'SDL2/include/SDL2' ]

NeoBundle 'scrooloose/syntastic.git'
"
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>

" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

"|
"| QuickFixSign
"|

" Show markers, quickfix and VCS status.
set lazyredraw
let g:quickfixsigns_events = ['BufEnter', 'CursorHold', 'CursorMoved', 'InsertLeave', 'InsertChange']
NeoBundle 'tomtom/quickfixsigns_vim'

"|
"| NERDTree
"|

" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" function! s:CloseIfOnlyNerdTreeLeft()
"     if exists("t:NERDTreeBufName")
"         if bufwinnr(t:NERDTreeBufName) != -1
"             if winnr("$") == 1
"                 q
"             endif
"         endif
"     endif
" endfunction
" let NERDTreeIgnore = ['\.o$', '\.a$']
" NeoBundle 'scrooloose/nerdtree.git'

"|
"| vimproc
"|

NeoBundle 'Shougo/vimproc.vim', {'build':{'linux' : 'make'}}

"|
"| Gundo
"|

nnoremap <F5> :GundoToggle<CR>
NeoBundle 'Gundo'

"|
"| Rainbow Parentheses.
"|

au VimEnter * RainbowParenthesesToggleAll
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

NeoBundle 'kien/rainbow_parentheses.vim'

"|
"| terryma/vim-multiple-cursors
"|

"NeoBundle 'terryma/vim-multiple-cursors'
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"|
"| wting/rust.vim
"|

NeoBundle 'wting/rust.vim'

"|
"| Solarized:
"|

NeoBundle 'https://github.com/altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_contrast="high"

"|
"| Distinguished
"|

NeoBundle 'https://github.com/Lokaltog/vim-distinguished'
let g:distinguished_termcolors=256

"|
"| Vim fugitive.
"|

NeoBundle 'https://github.com/tpope/vim-fugitive'

"|
"| Ctrl-P
"|

NeoBundle 'http://github.com/kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|wav|mp3|o|ogg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

"|
"| AirLine
"|

NeoBundle 'https://github.com/bling/vim-airline'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

"|
"| haskell:
"| vim2hs: dag/vim2hs
"|

NeoBundle 'https://github.com/dag/vim2hs'

call neobundle#end()

" Installation Check
NeoBundleCheck
