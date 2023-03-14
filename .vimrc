set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Set syntax highlighting and line numbers.
syntax on
set number

" Set the default tab size to 4 spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set the default encoding to UTF-8.
set encoding=utf-8

" Set the cursor line to be highlighted.
set cursorline

" Enable mouse support.
set mouse=a

" Enable clipboard support.
set clipboard=unnamedplus

" Enable autocompletion.
set completeopt=menuone,noinsert,noselect

" Set the default color scheme to gruvbox.
set background=dark
colorscheme gruvbox
" Map leader key to comma.
let mapleader=","

" Map keys for easier window navigation.
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Map keys for easier buffer navigation.
nnoremap <leader>b :ls<CR>:b<Space>

" Map keys for easier tab navigation.
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" Map keys for easier search and replace.
nnoremap <leader>s :%s//gI<Left><Left>
vnoremap <leader>s :s//gI<Left><Left>

" Map keys for easier commenting.
nnoremap <leader>c :CommentToggle<CR>
vnoremap <leader>c :CommentToggle<CR>

" Map key for easy saving.
nnoremap <leader>w :w<CR>

" Set up Vundle for managing plugins.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add plugins here.
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

" Set up NERDTree.
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.swp$']

" Set up FZF.
set rtp+=~/.fzf
set rtp+=~/.fzf/bin
set rtp+=~/.fzf/plugin
set rtp+=~/.fzf/autoload
command! -bang -nargs=* Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
