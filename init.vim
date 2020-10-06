" init.vim
" Author: Mathieu Demers
" Last update: June, 2020

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
Plug 'sirver/ultisnips'

" Comment in many languages with <leader>c[char]
Plug 'preservim/nerdcommenter'

" HTML/CSS writter abbreviation
Plug 'mattn/emmet-vim'

" Surround or unsurround a word, line or a block by a given expression
Plug 'tpope/vim-surround'

" Javascript improve syntax and indentation
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Plugins to improve Markdown experience.
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Use fzf in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'

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
colorscheme molokai

" Enable line numbers
set number

" Add new split window below
set splitbelow

" Add new vsplit window to the right
set splitright

" === vim-jsx-pretty === "
let g:vim_jsx_pretty_colorful_config=1

" === NERDTree === "

" Toggle NERDTree when you open a file
" autocmd vimenter * NERDTree

" Fix the size of NERDTree
let g:NERDTreeWinSize=22

" Fix the signcolumn highlight background
" both options seem to work :
highlight clear SignColumn
" or
" highlight! link SignColumn LineNr

" === coc.vim === "

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" === Folding === "

augroup folding
  autocmd!
  autocmd FileType html :setlocal foldmethod=indent foldlevel=2
  autocmd FileType javascript :setlocal foldmethod=syntax
augroup END

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

" ========================== "
" ==       MARKDOWN       == "
" ========================== "

augroup markdown
  autocmd!
  autocmd FileType markdown :setlocal textwidth=75 linebreak relativenumber conceallevel=2
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END 

" set linebreak
" set textwidth=70
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
noremap <silent> <cr> :noh<cr>

" Use <C-s> to write a buffer
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

" === For BÉPO layout === "
 " {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W

" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
noremap aé aw
noremap aÉ aW
noremap ié iw
noremap iÉ iW

" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <C-w>
noremap W <C-w><C-w> 

" === Zettelkasten === "
" Create a new zettel
nnoremap <leader>nz :NewZettel
" Change working directory for Vim and NERDTree
nnoremap <leader>cz :cd $HOME/Documents/Zettelkasten<cr> :NERDTreeCWD<cr>

" Mappings for fzf and ripgrep
nnoremap \ :Rg<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

" Map jk as <ESC> in insert mode and command line
" Not useful on my personnal computer because
" I remap CapsLock to <ESC> and the 2 Shift to CapsLock
" Uncomment to use it on another computer
"inoremap jk <esc>
"cnoremap jk <esc>

" === emmet.vim ==="
let g:user_emmet_leader_key='<C-,>'

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

" === UltiSnips === "
let g:UltiSnipsExpandTrigger="<c-n>"

" =========================== "
"     PLUGINS SETTINGS     == "
" =========================== "

" === Vimwiki === "
let g:vimwiki_list = [{'path': '~/vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Command to create a new Markdown file with a timestamp at 
" the beggining of the name.
let g:zettelkasten = "/home/matdem/Documents/Zettelkasten/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
