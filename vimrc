let mapleader = "\<Space>"

"
" Vundle setup
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
" Plugins
"

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'szw/vim-maximizer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/syntastic'
Plugin 'avakhov/vim-yaml'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-quickrun'
call vundle#end()
autocmd! bufwritepost vimrc source %

""
"" Plugin specific settings
""

"" YCM 
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" Delimit Mate
" automatically expand brackets after enter is hit
let g:delimitMate_expand_cr = 1

"" Ctrl-P
nnoremap <Leader>o :CtrlP<CR>
set wildignore+=*.pyc,*.swp,*.zip
let g:ctrlp_show_hidden = 1

"" Maximizer
let g:maximizer_set_default_mapping = 1
nnoremap <C-\> :MaximizerToggle<CR>
vnoremap <C-\> :MaximizerToggle<CR>gv
inoremap <C-\> :MaximizerToggle<CR>

"" Conque GDB
let g:ConqueGdb_Leader = ','

""Easy Motion
let g:EasyMotion_do_mapping = 0
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>s <Plug>(easymotion-s2)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

"" Nerdtree
let NERDTreeHijackNetrw=0
"" disable netrw 
let loaded_netrwPlugin = 1

" exclude compiled python files
let NERDTreeIgnore = ['\.pyc$']

"" YouCompleteMe
"nnoremap <Leader>g :YcmCompleter GoTo<CR>

"" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" fugitive
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gd :Gdiff<CR>

"open diff view of two files in a vertical manner
set diffopt+=vertical


"
" General
"
filetype indent on
filetype plugin on
set encoding=utf-8

au BufRead,BufNewFile *.es6 set filetype=javascript
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"search options
set ignorecase
set smartcase
set hlsearch!

"always show search result in the middle of the screen
set scrolloff=999
" un-/highlight word under cursor
nnoremap <CR> :noh<CR><CR>:<backspace>
" fix backspace problems
set backspace=2

" enable mouse usage
set mouse+=a

" do not create swap files with multiple open buffers
set noswapfile

" allow hiding buffers that have been modified but not saved
set hidden

" close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" open next buffer
nmap <leader>l :bnext<CR>

" open previous buffer
nmap <leader>h :bprevious<CR>

" round indent to multiple of shiftwidth --> applies to > and <
set shiftround

" copy and paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" automatic reloading of vimrc 
autocmd! bufwritepost vimrc source %

" avoid 'HIT ENTER' prompt
command! -nargs=+ Silent execute 'silent <args>' | redraw!
nmap <Leader>m :w<CR> :Silent make <bar> cwindow<CR>
nmap <Leader>mc :w<CR> :Silent make clean <bar> cwindow<CR>

" keep focus of cursor in current window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" set directory of current file as working directory
autocmd BufEnter * silent! lcd %:p:h

"
" UI stuff
"

" show line numbers 
:set number

" set UI colorscheme
set background=dark
colorscheme solarized

" use syntax highlighting
syntax enable

" remap navigation of splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

set splitright
set splitbelow

"
" white space highlighting
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()



"
" vim-airline
"

" set theme
"let g:airline_theme='luna'

" always show airline
set laststatus=2

" use power line fonts
let g:airline_powerline_fonts = 1

" show all open buffers
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode=1

nmap <leader>1 1 <C-w><C-w>
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" time to leave insert mode
"set timeoutlen=50

"
" File related 
" 

" remap writing of a file
noremap <Leader>w :w<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

":Mappings
noremap <Leader>n :NERDTreeToggle<CR>

"
" normal mode
"

" move line downwards
"nnoremap - ddp

" move line upwards
"nnoremap _ ddkP

" Show word type for current word e.g. 'cCppString'
"nnoremap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
    "if !exists("*synstack")
        "return
    "endif
    "echo noremap(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc


"
" insert MODE
"

"" delete current line in insert mode
"inoremap <c-d> <esc>ddi

