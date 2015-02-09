set nocompatible

" vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jgdavey/tslime.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-surround'
Plugin 'lukaszb/vim-web-indent'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Bundle 'chase/vim-ansible-yaml'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
" vundle end

set number
set ruler

syntax on
let mapleader = ","

" stop code folding
" http://stackoverflow.com/a/5017035/182484
let g:vim_markdown_folding_disabled=1

"
" http://robots.thoughtbot.com/post/55273519322/running-specs-from-vim-sent-to-tmux-via-tslime
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--config /Users/timothysabat/Sites/CPOR/cp/.eslintrc"

" https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,jquery,jasmine'

"""""""""
" easy-motion
"""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"""""""""
" end easy-motion
"""""""""

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctags
set tags=tags;/
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>


set t_Co=256

"encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:Â·
set autoindent          " always set autoindenting on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

:au BufNewFile,BufRead *.md set wrap

" search stuff
" http://amix.dk/blog/post/19083
set incsearch
set hlsearch

"Status bar
let laststatus=2

"History stuff
set history=300          " keep 50 lines of command line history
set showcmd             " display incomplete commands

"http://www.vim.org/tips/tip.php?tip_id=696
" dont let mouse switch into selection mode
set mouse=a

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\.pyc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFind<CR>

" Toggle highlight search
map <Leader>z :set hls!<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.scss set filetype=scss

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=0

" ruby filetypes
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Restore cursor position
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

"map for split movement
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-H> <C-W>h<C-W>
map <C-L> <C-W>l<C-W>

" gist stuff
let g:gist_detect_filetype = 1
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    let g:gist_clip_command = 'pbcopy'
    let g:gist_show_privates = 1
    let g:gist_post_private = 1
  endif
endif

" ctlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_arg_map = 1

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/python_full_stack/source/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '*/python_full_stack/source/*'
let g:ctrlp_open_new_file = 'h'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" map Silver Searcher
map <leader>a :Ag!<space>

" search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" backup
set directory=/tmp/

" paste toggle
" http://amix.dk/blog/post/19083
nmap <Leader>tt :set paste!<BAR>:set paste?<CR>
