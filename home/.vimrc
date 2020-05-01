set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'            " :G git commands
Plugin 'vim-airline/vim-airline'       " infoline under editing window
Plugin 'mhinz/vim-signify'             " git/vcs diff gutter, shown left of linenumbers
Plugin 'vim-syntastic/syntastic'       " syntax checking
Plugin 'majutsushi/tagbar'             " :TagbarToggle tags overview of current source file
Plugin 'ycm-core/YouCompleteMe'        " <3 
Plugin 'scrooloose/nerdtree'           " explorer.exe
Plugin 'SirVer/ultisnips'              " snippets engine
Plugin 'honza/vim-snippets'            " snippets
Plugin 'mileszs/ack.vim'               " :Ack
Plugin 'ctrlpvim/ctrlp.vim'            " :CtrlP fuzzy search file names 
Plugin 'terryma/vim-multiple-cursors'  " multiple cursors
Plugin 'vim-scripts/hexHighlight.vim'  " display hexcolors
Plugin 'sjl/gundo.vim'                 " :GundoToggle graphical undo
Plugin 'christoomey/vim-conflicted'    " git conflict resolviN
Plugin 'easymotion/vim-easymotion'     " motions on speed
Plugin 'godlygeek/tabular'             " align text
Plugin 'editorconfig/editorconfig-vim' " parse .editorconfig
Plugin 'vim-vdebug/vdebug'             " dbgp client

Plugin 'sheerun/vim-polyglot'          " syntax and language specific thingies
Plugin 'mkarmona/colorsbox'            " muh vim colorscheme

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

" more powerful backspacing
set backspace=2

" Vim Spell
set nospell

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
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>

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

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

" vim-signify
set updatetime=100

" Syntastic - Linting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"

let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python' ]

let g:syntastic_yaml_checkers = ['jsyaml']

let g:syntastic_html_tidy_exec = 'tidy'

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" Set colorscheme
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

" YCM
let g:ycm_language_server = [
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ 'node', expand( '$HOME/apps/lsp/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
  \     'filetypes': [ 'yaml' ],
  \   },
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'php', expand( '$HOME/apps/lsp/php/vendor/bin/php-language-server.php' ) ],
  \     'filetypes': [ 'php' ],
  \   },
  \   { 'name': 'vue',
  \     'filetypes': [ 'vue' ], 
  \     'cmdline': [ expand( '$HOME/apps/lsp/vue/node_modules/.bin/vls' ) ]
  \   },
  \   { 'name': 'docker',
  \     'filetypes': [ 'dockerfile' ], 
  \     'cmdline': [ expand( '$HOME/apps/lsp/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
  \   }
  \ ]

" Map for displaying highlight groups under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
