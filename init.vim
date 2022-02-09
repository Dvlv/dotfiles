call plug#begin('~/.vim/neovim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cloudhead/neovim-fuzzy'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jaxbot/semantic-highlight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

" default lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}


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
set relativenumber
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

let g:coc_disable_startup_warning = 1

let g:semanticTermColors = [1, 2, 3, 5, 6, 17, 19, 22, 24, 28, 30, 34, 52, 54, 58, 59, 60, 64, 66, 70, 88, 91, 98, 100, 102, 107, 125, 129, 136, 142, 170, 178, 181, 205, 242]
let g:semanticGUIColors = ['#800000', '#808000', '#800080', '#008080', '#00005f', '#005f87', '#0000af', '#008787', '#00af00', '#5f0087', '#5f8700', '#870000', '#8700af', '#875fd7', '#878700', '#87af5f', '#af005f', '#af00ff', '#af8700', '#afaf00', '#d75fd7', '#d7afaf', '#ff5faf']

let g:colorizer_auto_filetype='css,html,scss,sass,less'
let g:colorizer_startup=0

"inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <C-q> :FuzzyOpen<CR>

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> ge <Plug>(coc-diagnostic-next-error)
"nmap <C-s> :call CocAction('jumpDefinition', 'split')<CR>
"nmap <C-t> <Plug>(coc-definition)

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

"Easymotion
nmap s <Plug>(easymotion-overwin-f)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <leader>w <Plug>(easymotion-w)

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
autocmd FileType python autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
" autocmd FileType python autocmd BufWritePre <buffer> call CocAction('format')

autocmd FileType python setlocal foldmethod=indent
autocmd FileType lua setlocal foldmethod=indent
autocmd FileType typescript setlocal foldmethod=indent
autocmd FileType typescript.tsx setlocal foldmethod=indent
autocmd FileType javascript setlocal foldmethod=indent
autocmd FileType php setlocal foldmethod=indent
autocmd FileType html setlocal foldmethod=indent
autocmd FileType htmldjango setlocal foldmethod=indent

autocmd FileType scss setl iskeyword+=@-@

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

let g:deoplete#auto_complete_delay = 100

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)


luafile /home/Dvlv/.config/nvim/lua/init.lua
