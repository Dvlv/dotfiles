" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

nmap - $
nmap m ]m
nmap <C-t> <C-]>
nmap <Left> <nop>
nmap <Right> <nop>
nmap <Up> <nop>
nmap <Down> <nop>


map <C-s> :w<CR>
map <C-f> :LAck! -Q ""<left>
map <C-n> :NERDTreeToggle<CR>
map <C-b> :buffers<CR>
cnoreabbrev sem SemanticHighlight
cnoreabbrev semr SemanticHighlightRevert

let g:semanticTermColors = [1, 3, 5, 6, 17, 30, 34, 54, 64, 88, 91, 98, 100, 107, 125, 129, 136, 142, 170, 181, 205]
let g:semanticGUIColors = ['#800000', '#808000', '#800080', '#008080', '#00005f', '#008787', '#00af00', '#5f0087', '#5f8700', '#870000', '#8700af', '#875fd7', '#878700', '#87af5f', '#af005f', '#af00ff', '#af8700', '#afaf00', '#d75fd7', '#d7afaf', '#ff5faf']
let g:ctrlp_map = '<C-S-q>'
let g:ctrlp_path_nolim=1
let g:ctrlp_path_sort=1
let g:ctrlp_max_files=0
let ctrlp_custom_ignore='env\|env3.7\|node_modules\|tags\|flyway*\|htmlcov\|__pycache__'
let g:dutyl_neverAddClosingParen=1

autocmd! bufwritepost .vimrc source %
autocmd VimEnter *.md,*.rst,*.txt,*.html,*.jinja let b:dontsem=1

fun! MaybeSem()
    if exists('b:dontsem')
        return
    endif
    if &ft =~ 'markdown\|html\|text'
        return
    endif
    SemanticHighlight
endfun

autocmd VimEnter * call MaybeSem()
autocmd InsertLeave * call MaybeSem()

"autocmd InsertLeave * SemanticHighlight


let g:ale_lint_on_insert_leave=1
let g:ale_fixers = ["black"]
let g:ale_fix_on_save=1
let g:ale_virtualenv_dir_names = ["env"]
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set relativenumber
set number
set t_Co=256
set background=light
set hidden
set nomodeline
colorscheme unicon

execute pathogen#infect()
"call dutyl#register#tool('dcd-server','/run/user/1000/dcd.socket')
syntax on
filetype plugin indent on

autocmd FileType python setlocal completeopt-=preview




" Plugin list: dutyl, unicon, ctrlP, semantic-highlight, ack, pathogen,
" vim-airline, vim-airline-themes, ale

