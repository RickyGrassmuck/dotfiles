set nocompatible
let mapleader="\<SPACE>"

" auto-install vim-plug                                                                                             
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                           
  autocmd VimEnter * PlugInstall                                                                                    
endif          

call plug#begin(expand('~/.config/nvim/plugged')) " plugins' root path
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-perl/vim-perl'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'maksimr/vim-jsbeautify'
call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall
endif

" Required:
filetype plugin indent on
syntax enable

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display Line Numbers
nnoremap <leader>n :set nonumber!<CR>

"searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Buffers
set hidden

" No Mouse support
set mouse=v

" Python binaries
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" for perl (grossness)
autocmd Filetype perl call SetPerlOpts()
function SetPerlOpts()
	setlocal autoindent
	setlocal smartindent
	setlocal ts=4
	setlocal shiftwidth=4
	setlocal softtabstop=4
	setlocal expandtab
	setlocal makeprg=perl\ -c\ %\ $*
	setlocal errorformat=%f:%l:%m
	setlocal autowrite
endfunction

autocmd Filetype python call SetPythonOpts()
function SetPythonOpts()
    set autoindent
    set smartindent
    set ts=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
endfunction

autocmd filetype crontab setlocal nobackup nowritebackup
