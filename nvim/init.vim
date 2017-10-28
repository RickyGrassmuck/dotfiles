set nocompatible
set runtimepath+=~/.config/nvim/dein.vim " path to dein.vim
let mapleader="\<SPACE>"

call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': "make"})
call dein#add('Shougo/unite.vim')
call dein#add('klen/python-mode')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('vim-perl/vim-perl')

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Enable plugins

nnoremap <leader>i :call dein#install()<Cr>

" Pymode Options
let g:pymode_options_colorcolumn = 0

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Display Line Numbers
set number

"searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Buffers
set hidden

" No Mouse support
set mouse=i

" editorconfig fix for neovim
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" Python binaries
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" jsbeautify configurations

" Set custom .editorconfig directory

" for javascript
autocmd FileType javascript noremap <buffer>  <leader>f :call JsBeautify()<cr>

" for json
autocmd FileType json noremap <buffer> <leader>f :call JsonBeautify()<cr>

" for jsx
autocmd FileType jsx noremap <buffer> <leader>f :call JsxBeautify()<cr>

" for html
autocmd FileType html noremap <buffer> <leader>f :call HtmlBeautify()<cr>

" for css or scss
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>

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
