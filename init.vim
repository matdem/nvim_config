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

" Comment in many languages with <leader>c[char]
Plug 'preservim/nerdcommenter'

" HTML/CSS writter abbreviation
Plug 'mattn/emmet-vim'

" Javascript improve syntax and indentation
Plug 'pangloss/vim-javascript'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Changes numbers for relative numbers
"Plug 'myusuf3/numbers.vim'

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

" Enable true color support
set termguicolors

" Set colorscheme to sublimemonokai
colorscheme sublimemonokai

" Enable line numbers
set number

" Add new split window below
set splitbelow

" Add new vsplit window to the right
set splitright
" === NERDTree === "
" Toggle NERDTree when you open a file
autocmd vimenter * NERDTree

" Fix the size of NERDTree
let g:NERDTreeWinSize=22

" === coc.vim === "
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" === Folding === "
autocmd FileType html :setlocal foldmethod=indent foldlevel=2

" === NERDCommenter === "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

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

" Tab completion command-line works even if the command begins with a Caps.
set smarttab

" Indentation amount for < and > commands
set shiftwidth=2

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Change number of spaces that a <TAB> counts dor during editing ops
set softtabstop=2

" Don't remember what do those settings
"set linebreak
"set textwidth=70
"set smartindent

" =========================== "
"          MAPPINGS        == "
" =========================== "

" Mapping <leader> to «
let g:mapleader='«'  

" Mapping to open my init.vim
nnoremap <leader>ev :split $MYVIMRC<CR>

" Mapping to source my init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>
" Toggle NERDTree
noremap <C-n> :NERDTreeToggle<CR>  

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Use <C-s> to write a buffer
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

" Map jk as <ESC> in insert mode and command line
" Not useful on my personnal computer because
" I remap CapsLock to <ESC> and the 2 Shift to CapsLock
" Uncomment to use it on another computer
"inoremap jk <esc>
"cnoremap jk <esc>

" === emmet.vim ==="
"let g:user_emmet_leader_key='<leader>'

" === coc-prettier === "
vnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

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

" Symbol renaming -> Rename all related variable in all open buffer.
nmap <leader>rn <Plug>(coc-rename)
