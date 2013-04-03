call pathogen#infect()
call pathogen#helptags()

filetype off
syntax on

filetype on
filetype plugin on
filetype indent on

colorscheme peachpuff

set nocompatible
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2
set nosmartindent
set showmatch
set showmode
set joinspaces

set smarttab
set autoindent
set mat=5 " Bracket blinking

" set backup                   " Enable creation of backup file.
" set backupdir=~/.vim/backups " Where backups will go.
" set directory=~/.vim/tmp     " Where temporary files will go.

autocmd BufRead,BufNewFile *.ru set filetype=Rackup
autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead .simplecov set filetype=ruby

set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

set hlsearch                  " Highlight matches
set incsearch                 " Incremental searching
set ignorecase                " Searches are case insensitive...
set smartcase                 " ... unless they contain at least one capital letter

set history=250

set scrolloff=3               " Have some context around the current line always on screen

" Don't use Ex mode, use Q for formatting
map Q gq

let mapleader=","

" Switch to previous buffer
nnoremap <leader><leader> <c-^>

" Remove whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Rails.vim customization
autocmd User Rails            Rnavcommand service app/services -glob=**/* -suffix=.rb
autocmd User Rails            Rnavcommand config  config       -glob=* -suffix=.yml

