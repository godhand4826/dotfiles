set nocompatible
set t_Co=256
set t_ut=
let mapleader=','
set encoding=utf-8
scriptencoding utf-8
set history=100
set wildmenu
set hidden
set undofile
set undodir=$HOME/.vimcache/undo
set undolevels=1000
set undoreload=10000
set number relativenumber
set cursorline
set scrolloff=5
set showmode showcmd ruler
" set showmatch matchtime=0
set updatetime=100 " for vim-gitgutter
syntax on
filetype on
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4
set autoindent smartindent
set shiftround
set nowrap
set listchars=eol:¬,tab:▸\ ,trail:.,
set complete+=kspell
set incsearch hlsearch ignorecase smartcase
set splitbelow splitright

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
" Plug 'flazz/vim-colorschemes'

Plug 'w0rp/ale'
Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'

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
call plug#end()

colorscheme codedark
let g:airline_theme = 'codedark'
" let g:airline_powerline_fonts = 1
" let g:airline#extension#tabline#enabled = 1
" let g:airline#extension#tabline#formatter = 'unique_tail_improved'
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
" let g:ctrlp_prompt_mappings = {
			" \'AcceptSelection("e")': [],
			" \'AcceptSelection("t")': ['<cr>'],
			" \}

nnoremap <leader>m :call MouseEnableToggle()<cr>
function! MouseEnableToggle()
	if &mouse!=""
		set mouse=
	else
		set mouse=a
	endif
endfunction
nnoremap <leader>t :call TrimRight()<cr>
function! TrimRight()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction
xnoremap @ :<c-u>call ExecuteMacoroOverVisualRange()<cr>
function! ExecuteMacoroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>o :NERDTreeToggle<cr>
autocmd BufEnter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>ct :!ctags -R .<cr>
nnoremap <leader><leader> :terminal<cr>
nnoremap <leader>/ :noh<cr>
noh
nnoremap <leader>p :cprevious<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>s :set invspell<cr>
nnoremap <leader>h :tab help<space>

autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType help noremap <buffer> q :q<cr>

