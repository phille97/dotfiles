set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/L9'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'SirVer/ultisnips'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/codepad'
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'sjl/gundo.vim'
Plugin 'christoomey/vim-conflicted'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hdima/python-syntax'
Plugin 'othree/yajs.vim' " Javascript Syntax
Plugin 'mitsuhiko/vim-jinja'
Plugin 'sickill/vim-monokai'
Plugin 'jnurmine/Zenburn'
Plugin 'mkarmona/colorsbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Keymaps
inoremap <c-t> <Esc>:NERDTreeToggle<CR>
map <C-t> :NERDTreeToggle<CR>
nmap <C-s> :TagbarToggle<CR>
nnoremap ; :
map <c-j> <c-w><down>
map <c-k> <c-w><up>
map <c-l> <c-w>l
map <c-h> <c-w>h

" CtrlP
map <c-b> :CtrlPBuffer<CR>

" Vim standard options
syntax enable
set ruler
set hidden
set number
set laststatus=2
set smartindent
let &colorcolumn="80"

" Indent Guides
set st=4 sw=4 et

" Gvim options
set guifont=Source\ Code\ Pro\ 10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" NERDTree - File tree browser
let NERDTreeWinSize = "49"
let NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', '^dist$', '^__pycache__$', '.*\.egg-info$']

" Vim Multile Cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" YCM
"nnoremap <leader>g :YcmCompleter GoToDefinition<CR>

" PIV
let g:DisableAutoPHPFolding = 1

" Vim - Snippets
let g:UltiSnipsExpandTrigger="<c-enter>"
let g:UltiSnipsJumpForwardTrigger="<c-enter>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" Syntastic - Linting
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"

let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python' ]

let g:syntastic_yaml_checkers = ['jsyaml']

let g:syntastic_html_tidy_exec = 'tidy'


colorscheme colorsbox-material 

" Set mapleader
let mapleader=","

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Symbols used by Airline
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '¬'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1

" Vim Spell
set nospell

" Map for displaying highlight groups under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>


" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
