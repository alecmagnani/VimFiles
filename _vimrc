set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-startify'
Plugin 'idbrii/AsyncCommand'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" to ignore plugin indent changes, instead use:
"filetype plugin on
"
" brief help
" :pluginlist       - lists configured plugins
" :plugininstall    - installs plugins; append `!` to update or just :pluginupdate
" :pluginsearch foo - searches for foo; append `!` to refresh local cache
" :pluginclean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for faq
" put your non-plugin stuff after this line
syntax on
color corn
:cd c:\users\alec
set lines=50
set columns=200
:set backspace=2

"f1 to compile java file, f2 to run it
map <F1> :call CompileFile()<cr>
func! CompileFile()
	exec "w"
	if &filetype == 'java'
		exec "!javac %"
	endif
endfunc

map <F2> :call RunFile()<CR>
func! RunFile()
	if &filetype == 'java'
		exec "!java -cp %:p:h %:t:r"
	elseif &filetype == 'python'
		exec "!python3.5 %"
	endif
endfunc

set showcmd
:let mapleader = "\<Space>" 
:map <Leader>A o <Esc>
:map <Left> :echo 'Use H'
:map <Right> :echo 'Use L'
:map <Up> :echo 'Use K'
:map <Down> :echo 'Use J'
set list lcs=tab:\|\ 
set number
set mouse=a
:inoremap <F4> <C-R>=expand("%:t:r")<CR>
:set splitbelow
:set splitright
inoremap { {<CR>}<Esc>ko

"CtrlP settings
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
let g:airline#extensioins#tabline#enabled = 1

