set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/AutoTag'
" Bundle 'xolox/vim-easytags'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rking/ag.vim'
Bundle 'juvenn/mustache.vim'
" Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/unite.vim'

syntax on
filetype plugin indent on
colorscheme peachpuff

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

set backup
set backupdir=~/.vim/tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp
set directory=~/.vim/tmp,~/tmp

autocmd BufRead,BufNewFile *.ru set filetype=Rackup
autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead .simplecov set filetype=ruby

set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

set hlsearch                  " Highlight matches
set incsearch                 " Incremental searching
set ignorecase                " Searches are case insensitive...
set smartcase                 " ... unless they contain at least one capital letter

set history=1000

set scrolloff=3               " Have some context around the current line always on screen

" Don't use Ex mode, use Q for formatting
map Q gq

let mapleader=" "

" Switch to previous buffer
nnoremap <leader><leader> <c-^>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Ruby end inserting
" Does not work that well
" if !exists( "*RubyEndToken" )
"   function RubyEndToken()
"     let current_line = getline( '.' )
"     let braces_at_end = '{\s*|\(,\|\s\|\w*|\s*\)\?$'
"     let stuff_without_do = '^\s*class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def'
"       let with_do = 'do\s*|\(,\|\s\|\w*|\s*\)\?$'

"       if match(current_line, braces_at_end) >= 0
"         return "\<CR>}\<C-O>O"
"       elseif match(current_line, stuff_without_do) >= 0
"         return "\<CR>end\<C-O>O"
"       elseif match(current_line, with_do) >= 0
"         return "\<CR>end\<C-O>O"
"       else
"         return "\<CR>"
"       endif
"     endfunction
" endif

" imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

" Rails.vim customization
" let g:rails_projections = {
"       \ "app/commands/*.rb": {
"       \   "command": "command",
"       \   "template":
"       \     "class %S < Command\nend",
"       \   "test": [
"       \     "test/commands/%s_test.rb",
"       \     "spec/commands/%s_spec.rb"
"       \   ]
"       \ },
"       \ "app/services/*.rb": {
"       \   "command": "service",
"       \   "test": [
"       \     "test/services/%s_test.rb",
"       \     "spec/services/%s_spec.rb"
"       \   ]
"       \ },
"       \ "app/domain/*.rb": {
"       \   "command": "domain",
"       \   "test": [
"       \     "test/domain/%s_test.rb",
"       \     "spec/domain/%s_spec.rb"
"       \   ]
"       \ },
"       \ "config/*.yml": {"command": "config"}
"       \ }

" Rspec.vim mappings
let g:rspec_command = "!bin/rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" NERDTree
" map <C-n> :NERDTreeToggle<CR>

" Unite
" nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
" nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
" nnoremap <Leader>g :Unite grep:.<cr>

" Unite - CtrlP-style search
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async','sorters','sorter_rank')
" nnoremap <Leader>f :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>


" Highlight long lines
hi ColorColumn ctermfg=1 ctermbg=7
let &colorcolumn="80,".join(range(120,999),",")

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

