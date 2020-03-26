set nocompatible
let mapleader='\'
set timeout timeoutlen=2000 ttimeoutlen=0
set signcolumn=yes
set updatetime=200
set mouse=
xnoremap <leader> :w !xclip -sel clip<cr><cr>
set hidden
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :edit ~/.vimrc<cr>
set number relativenumber
set cursorline
set showmode showcmd ruler
set rulerformat=%40(%f\ %y%=%b\ 0x%B\ %l,%c%V\ %p%%%)
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
set shiftwidth=4 tabstop=4 " expandtab softtabstop=4
set autoindent smartindent
set shiftround
set complete+=kspell

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
Plug 'sgur/vim-textobj-parameter'

Plug 'w0rp/ale'
" Plug 'vim-scripts/taglist.vim'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'kien/ctrlp.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:gitgutter_map_keys = 0

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight ALEWarning cterm=underline
highlight ALEError cterm=underline
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\}

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" let g:deoplete#enable_at_startup = 1

" tpope/vim-characterize
" unicode.vim
