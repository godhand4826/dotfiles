set nocompatible
let mapleader='\'
set encoding=utf-8
cnoremap openas e ++enc=
set timeout timeoutlen=2000 ttimeoutlen=0
set signcolumn=yes
set updatetime=200
set mouse=
xnoremap <leader> :'<,'>w !xclip -sel clip<cr><cr>
set hidden
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :edit ~/.vimrc<cr>
set number relativenumber
set cursorline
set showmode showcmd ruler
set rulerformat=%50(%f\ %y%{FileSize()}%=%b\ 0x%B\ %l,%c%V\ %p%%%)
set wildmenu
set history=500
cnoremap tee execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
set incsearch hlsearch ignorecase smartcase
nnoremap <leader><leader> :set hlsearch!<cr>
set nowrap sidescroll=1
set splitbelow splitright
set listchars=eol:¬,tab:»\ ,trail:.,precedes:«,extends:…,
nnoremap <leader>l :set list!<cr>
syntax on
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4 " expandtab
set autoindent smartindent
set shiftround
set complete+=kspell

inoremap jj <Esc>`^
inoremap kk <Esc>`^
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

xnoremap @ :<c-u>call MacoroOverVisualRange()<cr>
function! MacoroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <leader>m :call ToggleMouse()<cr>
function! ToggleMouse()
  if &mouse!=""
      set mouse=
  else
      set mouse=a
  endif
endfunction

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'terryma/vim-multiple-cursors'
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

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme', { 'do': 'python3 install.py --all' }
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'vim-scripts/taglist.vim'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Plug 'valloric/youcompleteme'
" let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview
" Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 2
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight ALEWarning cterm=underline
highlight ALEError cterm=underline
let g:ale_fixers = {
     \ '*': ['remove_trailing_lines', 'trim_whitespace'],
     \ 'go': ['gofmt'],
     \ 'javascript' : ['prettier', 'eslint'],
	 \ 'rust': ['rustfmt'],
 \}

" Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Plug 'autozimu/LanguageClient-neovim'
" let g:LanguageClient_changeThrottle = 5
" let g:LanguageClient_completionPreferTextEdit = 0
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_applyCompletionAdditionalTextEdits = 0
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" tpope/vim-characterize
" unicode.vim
