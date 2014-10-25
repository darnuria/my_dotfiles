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
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>
NeoBundle 'scrooloose/syntastic.git'

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
"| haskell:
"| vim2hs: dag/vim2hs
"|

NeoBundle 'https://github.com/dag/vim2hs'

"|
"|
"|
NeoBundle 'https://github.com/tpope/vim-fugitive'

"|
"| AirLine
"|
NeoBundle 'https://github.com/bling/vim-airline'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1


call neobundle#end()

" Installation Check
NeoBundleCheck
