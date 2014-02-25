"|
"| File 	: ~/.vim/plugins.vim
"| Source 	: https://github.com/darnuria/my_dotFiles
"| Licence 	: UNLICENCE
"|

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"|
"| nerdcommenter
"|

let g:NERDSpaceDelims = 1
" let g:NERDCustomDelimiters = {
" \ 'javascript': { 'left': '//~ ', 'leftAlt': '/**', 'rightAlt': '*/'}
" \ }
NeoBundle 'scrooloose/nerdcommenter'

"|
"| Syntastics
"|

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '★'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '>'
let g:syntastic_c_include_dirs = [ '.', '..', './includes', '../libopt/inc', './libft/includes', 'SDL2/include/SDL2' ]
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
let NERDTreeIgnore = ['\.o$', '\.a$']
NeoBundle 'scrooloose/nerdtree.git'

" Recommended to install
" NeoBundle 'Shougo/vimproc', {
" \ 'build' : {
" \     'windows' : 'make -f make_mingw32.mak',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make -f make_mac.mak',
" \     'unix' : 'make -f make_unix.mak',
" \    },
" \ }


"|
"| Gundo
"|

nnoremap <F5> :GundoToggle<CR>
NeoBundle 'Gundo'

"|
"| Rainbow Parentheses
"|

au VimEnter * RainbowParenthesesToggleAll
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
NeoBundle 'kien/rainbow_parentheses.vim'

"|
"| terryma/vim-multiple-cursors
"|

NeoBundle 'terryma/vim-multiple-cursors'
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"|
"| wting/rust.vim
"|

NeoBundle 'wting/rust.vim'

" Installation Check
NeoBundleCheck
