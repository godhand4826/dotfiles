set t_Co=256
set nocompatible
let mapleader='\'
set encoding=utf-8
set timeout timeoutlen=500 ttimeoutlen=0
set signcolumn=yes
set updatetime=200
set mouse=
set hidden
set nobackup
set undodir=~/.vim/undo-dir
set undofile
set path=.,,**
set wildignore+=**/node_modules/**,**/.git/**
set number relativenumber
set cursorline
set showmode showcmd ruler
set rulerformat=%50(%=%t\ %y%{FileSize()}[%L]\ %l,%c%V\ %p%%%)
set wildmenu wildmode=longest,full
set history=500
set incsearch hlsearch ignorecase smartcase
set nowrap sidescroll=1
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set splitbelow splitright
set listchars=eol:¬,tab:»\ ,trail:.,precedes:«,extends:…,
syntax on
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set autoindent smartindent
set shiftround
set complete+=kspell
set completeopt-=preview

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'gaving/vim-textobj-argument'

Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'natebosch/vim-lsc'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'Chiel92/vim-autoformat'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

let g:gitgutter_map_keys = 0
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {
            \ 'haskell': '/usr/local/bin/haskell-language-server-wrapper-Linux --lsp',
            \ 'javascript': '/usr/local/bin/javascript-typescript-stdio',
            \ 'python': '/usr/local/bin/pyls',
            \ 'go': 'gopls',
            \}

" Plug 'w0rp/ale'
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 0
" let g:ale_sign_column_always = 2
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" highlight ALEWarning cterm=underline
" highlight ALEError cterm=underline
" let g:ale_fixers = {
"     \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"     \ 'go' :['gofmt'],
"     \ 'javascript' : ['prettier', 'eslint'],
"     \ 'rust': ['rustfmt'],
"     \}

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <C-p> :Files<cr>
xnoremap <leader> :'<,'>w !xclip -sel clip<cr><cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :edit ~/.vimrc<cr>
cnoremap tee execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
nnoremap <leader>m :exec &mouse!="" ?"set mouse=":"set mouse=a"<cr>:echo "toggle mouse"<cr>
nnoremap <leader><leader> :set hlsearch!<cr>
nnoremap <leader>l :set list!<cr>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
autocmd BufWritePre * %s/\s\+$//e
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd FileType gitcommit,markdown setlocal spell
autocmd FileType javascript nnoremap ,l :!clear && node %<cr>
autocmd BufWrite *.js,*.go :Autoformat

xnoremap @ :<c-u>call MacoroOverVisualRange()<cr>
function! MacoroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    elseif bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

