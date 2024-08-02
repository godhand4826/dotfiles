set t_Co=256
set background=dark
set nocompatible
set encoding=utf-8
set timeout timeoutlen=500
set signcolumn=yes
set updatetime=200
set clipboard=unnamed
set mouse=
set hidden
set noswapfile
set path=.,,**
set wildignore+=**/node_modules/**,**/.git/**
set number relativenumber
set cursorline
set showmode showcmd ruler
set wildmenu wildmode=longest,full
set history=500
set colorcolumn=
set incsearch hlsearch ignorecase smartcase
set wrap sidescroll=1 showbreak=↪
set splitbelow splitright
set listchars=eol:↵,tab:→\ ,lead:.,trail:.,precedes:«,extends:»,
syntax on
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
set autoindent smartindent
set shiftround
set complete+=kspell
set completeopt-=preview

call mkdir($HOME."/.vim/undodir", "p", 0700)
set undodir=~/.vim/undodir
set undofile

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'vim-scripts/ReplaceWithRegister'
	Plug 'tpope/vim-repeat'
	Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-unimpaired'

	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'kana/vim-textobj-indent'
	Plug 'glts/vim-textobj-comment'
	Plug 'kana/vim-textobj-entire'
	Plug 'gaving/vim-textobj-argument'

	Plug 'fcpg/vim-osc52'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mileszs/ack.vim'
call plug#end()

let mapleader='\'
let g:gitgutter_map_keys = 0
let g:ack_default_options =
	\ " -s -H --nocolor --nogroup --column --smart-case --ignore-dir=.gopath --ignore-dir=target"

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghd :GitGutterDiffOrig<CR>
nnoremap <C-P> :Files<CR>
nnoremap <LEADER>a :Ack<SPACE>
noremap <LEADER>y :Oscyank<CR>

nnoremap <C-L> :noh<CR>
nnoremap <LEADER>l :set list!<CR>
nnoremap <LEADER>m :call ToggleMouse()<CR>
nnoremap <LEADER><SPACE> :call RemoveTrailingSpace()<CR>
xnoremap @ :<C-U>call MacoroOverVisualRange()<CR>
nnoremap <silent> <LEADER>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <LEADER>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

highlight SignColumn ctermbg=black
highlight link TrailingSpace Todo
call matchadd('TrailingSpace', '\s\+$')
highlight link LongLine Todo
call matchadd('LongLine', '\%120c')

function! MacoroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! RemoveTrailingSpace()
	silent! execute ':%s/\s\+$//e'
    echo "trailing space removed"
endfunction

function! ToggleMouse()
	if &mouse == ''
		set mouse=a
		echo "mouse enabled"
	else
		set mouse=
		echo "mouse disabled"
	endif
endfunction

function! RunBuf(cmd) abort
  let buffer_content = getline(1, '$')
  let lines = systemlist(a:cmd, join(buffer_content, "\n"))
  if v:shell_error
    echo join(lines, "\n")
    return
  endif
  silent keepjumps call setline(1, lines)
  if line('$') > len(lines)
    silent keepjumps execute string(len(lines)+1).',$ delete'
  endif
endfunction

function! PrettierOnSave()
	autocmd! BufWritePre *
	autocmd BufWritePre * call RunBuf("npx prettier --stdin-filepath ".expand('%:t'))
endfunction

function! ClangFormatOnSave()
	autocmd! BufWritePre *
	autocmd BufWritePre * call RunBuf("clang-format")
endfunction

autocmd FileType javascript call JavascriptSetup()
function! JavascriptSetup()
	nnoremap ,l :!clear && node %<CR>
	call PrettierOnSave()
endfunction

autocmd FileType c,cpp call ClangSetup()
function! ClangSetup()
	call ClangFormatOnSave()
endfunction

