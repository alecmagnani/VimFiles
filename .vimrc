set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"My Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'scwood/vim-hybrid'
Plugin 'chriskempson/base16-vim'
Plugin 'michalbachowski/vim-wombat256mod'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""END VUNDLE - START OF MY SETTINGS""""""""""""""""""""""""
let mapleader = "\<Space>" 
set number
set ic
set hls
set lines=50
set columns=200
set backspace=2
set showcmd
set mouse=a
set nowrap

"Expermimental Status hiding
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set cmdheight=1

"Silence Vim
set noerrorbells visualbell t_vb=

"LaTeX settings
set grepprg=grep\ -H\ $*
filetype indent on
let g:text_flavor='latex'

syntax on
set background=dark
color dracula 
"Transparency
hi Normal ctermbg=none
highlight NonText ctermbg=none
"Line number color 
"highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>w :w<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
" nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:map <Leader>A o <Esc>
:map <Left> :echo 'Use H'
:map <Right> :echo 'Use L'
:map <Up> :echo 'Use K'
:map <Down> :echo 'Use J'

"Auto expand  {}s in .java files only
autocmd BufRead,BufNewFile *.java inoremap { {<CR>}<Esc>ko
autocmd BufRead,BufNewFile *.c inoremap { {<CR>}<Esc>ko

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" CTRLP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"Airline Settings
set laststatus=2
:let g:airline_theme='bubblegum'

"Ensure :q to quit even when Goyo is active
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	"Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
