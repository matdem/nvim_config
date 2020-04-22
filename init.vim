" init.vim
" Author: Mathieu Demers
" Last update: April, 2020

" ============================ "
" ==        PLUGINS         == "
" ============================ "

call plug#begin('~/.config/nvim/plugged')

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Install extensions for coc.nvim
  let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-pairs']

" Snippets
Plug 'honza/vim-snippets'

" Changes numbers for relative numbers
Plug 'myusuf3/numbers.vim'

" HTML/CSS writter abbreviation
Plug 'mattn/emmet-vim'

" Javascript improve syntax and indentation
Plug 'pangloss/vim-javascript'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Gives the git sign in the signcolumn
Plug 'airblade/vim-gitgutter'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'erichdongubler/vim-sublime-monokai'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Initialize plugin system
call plug#end()

" ============================ "
" ==       INTERFACE        == "
" ============================ "

" Set colorscheme to sublimemonokai
colorscheme sublimemonokai

" Enable line numbers
set number

" Toggle NERDTree when you open a file
autocmd vimenter * NERDTree

" Enable true color support
set termguicolors

" =========================== "
" ==   SEARCH IMPROVEMENT  == "
" =========================== "

" Case insensitive during a search
set ignorecase

" Become case sensitive if a Caps is detected
set smartcase

" =========================== "
" ==     KEYS BEHAVIORS    == "
" =========================== "

" Insert spaces when <TAB> is pressed
set expandtab

" ?
set smarttab

" Indentation amount for < and > commands
set shiftwidth=2

" ?
set tabstop=2

" Change number of spaces that a <TAB> counts dor during editing ops
set softtabstop=2

" Don't remember what do those settings
"set lbr
"set tw=500
"set si

" =========================== "
"          MAPPINGS        == "
" =========================== "

" Mapping <leader> to «
let g:mapleader='«'  

" Toggle NERDTree
noremap <F2> :NERDTreeToggle<CR>  

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Map jk as <ESC> in insert mode and command line
" Not useful on my personnal computer because
" I remap CapsLock to <ESC> and the 2 Shift to CapsLock
" Uncomment to use it on another computer
"inoremap jk <esc>
"cnoremap jk <esc>

" === emmet.vim ==="
"let g:user_emmet_leader_key='<leader>'

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
 let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
