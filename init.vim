call plug#begin('~/.vim/neovim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cloudhead/neovim-fuzzy'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jaxbot/semantic-highlight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'unblevable/quick-scope'

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

let g:Hexokinase_highlighters = ['backgroundfull']
let g:semanticTermColors = [1, 2, 3, 5, 6, 17, 22, 30, 34, 52, 54, 58, 64, 66, 88, 91, 98, 100, 102, 107, 125, 129, 136, 142, 170, 178, 181, 205, 242]
let g:semanticGUIColors = ['#800000', '#808000', '#800080', '#008080', '#00005f', '#008787', '#00af00', '#5f0087', '#5f8700', '#870000', '#8700af', '#875fd7', '#878700', '#87af5f', '#af005f', '#af00ff', '#af8700', '#afaf00', '#d75fd7', '#d7afaf', '#ff5faf']


inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <C-q> :FuzzyOpen<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-next-error)
nmap <C-t> <Plug>(coc-definition)

nmap - $
nmap m ]m
nmap <Left> <nop>
nmap <Right> <nop>
nmap <Up> <nop>
nmap <Down> <nop>

map <C-b> :buffers<CR>
map <C-f> :LAck! -Q ""<left>
map <C-i> :bn<CR>

"autocmd VimEnter *.md,*.rst,*.txt,*.html,*.jinja let b:dontsem=1

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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
