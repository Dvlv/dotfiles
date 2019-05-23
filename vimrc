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
map <C-f> :LAck! --ignore-dir env --ignore-dir env3.6 --ignore-dir env3.7 
map <C-n> :NERDTreeToggle<CR>
map <C-b> :buffers<CR>
cnoreabbrev sem SemanticHighlight
cnoreabbrev semr SemanticHighlightRevert

let g:semanticTermColors = [205, 170, 136, 129, 98, 88, 64, 34, 30, 17, 5, 3, 6, 1, 54, 100, 91, 107, 125, 142, 181]
let g:semanticGUIColors = ["#ff6600", "#705598", "#6da741", "#b00b0b"]
let g:ctrlp_map = '<C-S-q>'
let g:dutyl_neverAddClosingParen=1

autocmd! bufwritepost .vimrc source %
autocmd VimEnter *.md,*.rst,*.txt let b:dontsem=1

fun! MaybeSem()
    if exists('b:dontsem')
        return
    endif
    SemanticHighlight
endfun

autocmd VimEnter * call MaybeSem()
autocmd InsertLeave * call MaybeSem()
"autocmd InsertLeave * SemanticHighlight

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set relativenumber
set number
set t_Co=256
set background=light
colorscheme unicon

execute pathogen#infect()
"call dutyl#register#tool('dcd-server','/run/user/1000/dcd.socket')
syntax on
filetype plugin indent on





" Plugin list: dutyl, unicon, ctrlP, semantic-highlight, ack, pathogen

