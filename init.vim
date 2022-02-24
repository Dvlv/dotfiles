call plug#begin('~/.vim/neovim/plugged')

Plug 'cloudhead/neovim-fuzzy'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

" default lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'psf/black', { 'branch': 'stable' }
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


call plug#end()

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set undodir=~/.vim/undo-dir
set undofile

set nohlsearch
set ignorecase
set smartcase
set showmatch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set t_Co=256
set background=light
set hidden
set nomodeline
colorscheme unicon

cnoreabbrev sem SemanticHighlight
cnoreabbrev semr SemanticHighlightRevert

let mapleader = " "

" https://jonasjacek.github.io/colors/

let g:fuzzy_rootcmds = [ ["git", "rev-parse", "--show-toplevel"]]

let g:semanticTermColors = [1, 2, 3, 5, 6, 17, 19, 22, 24, 28, 30, 34, 52, 54, 58, 59, 60, 64, 66, 70, 88, 91, 98, 100, 102, 107, 125, 129, 136, 142, 170, 178, 181, 205, 242]
let g:semanticGUIColors = ['#800000', '#808000', '#800080', '#008080', '#00005f', '#005f87', '#0000af', '#008787', '#00af00', '#5f0087', '#5f8700', '#870000', '#8700af', '#875fd7', '#878700', '#87af5f', '#af005f', '#af00ff', '#af8700', '#afaf00', '#d75fd7', '#d7afaf', '#ff5faf']

nnoremap <C-q> :FuzzyOpen<CR>

nmap - $
nmap m ]m
nmap <Left> <nop>
nmap <Right> <nop>
nmap <Up> <nop>
nmap <Down> <nop>

map <C-b> :buffers<CR>
map <C-f> :LAck! -Q ""<left>
map <C-i> :bn<CR>

vnoremap <leader>y "+y
nnoremap <leader>p "+p

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

autocmd FileType javascript vnoremap <buffer> <leader>c :norm I//<cr>
autocmd FileType typescript vnoremap <buffer> <leader>c :norm I//<cr>
autocmd FileType typescript.tsx vnoremap <buffer> <leader>c :norm I//<cr>
autocmd FileType python     vnoremap <buffer> <leader>c :norm I#<cr>
autocmd FileType lua     vnoremap <buffer> <leader>c :norm I--<cr>

autocmd FileType javascript vnoremap <buffer> <leader><leader>c :norm ^xx<cr>
autocmd FileType typescript.tsx vnoremap <buffer> <leader><leader>c :norm ^xx<cr>
autocmd FileType python     vnoremap <buffer> <leader><leader>c :norm ^x<cr>
autocmd FileType lua     vnoremap <buffer> <leader><leader>c :norm ^xx<cr>

autocmd FileType python call MaybeSem()
autocmd FileType python autocmd BufWritePre <buffer> execute ':Black'

autocmd FileType python setlocal foldmethod=indent
autocmd FileType lua setlocal foldmethod=indent
autocmd FileType typescript setlocal foldmethod=indent
autocmd FileType typescript.tsx setlocal foldmethod=indent
autocmd FileType javascript setlocal foldmethod=indent
autocmd FileType php setlocal foldmethod=indent
autocmd FileType html setlocal foldmethod=indent
autocmd FileType htmldjango setlocal foldmethod=indent

autocmd FileType scss setl iskeyword+=@-@
autocmd FileType scss set norelativenumber


hi tsxTagName ctermfg=63
hi tsxCloseTagName ctermfg=63
hi tsxComponentName ctermfg=63
hi tsxCloseComponentName ctermfg=63
hi tsxCloseTag ctermfg=63
hi tsxTag ctermfg=63

hi diffAdded ctermfg=70
hi diffRemoved ctermfg=88


fun! MaybeSem()
    if exists('b:dontsem')
        return
    endif
    if &ft =~ 'markdown\|html\|text'
        return
    endif
    SemanticHighlight
endfun

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'



luafile /home/Dvlv/.config/nvim/lua/init.lua
