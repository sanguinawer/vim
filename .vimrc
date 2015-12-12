execute pathogen#infect()
execute pathogen#helptags()

syntax on
set tags=./tags,tags;
set autochdir
set nowrap
filetype plugin indent on
set ffs=unix,dos,mac
set mouse=a
set wildmenu
" configuramos la barra de estado
set laststatus=2
set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Col:\ %c
set cmdheight=2
set foldcolumn=0
set encoding=utf-8
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set number

" refresco  a 1 segundo
set ut=1000

if (1)  " 0 = peaksea / 1 = solarized
	" colorscheme solarized
	let g:solarized_termcolors=256
	set background=dark
	colorscheme solarized
else
	" colorscheme peaksea
	set t_Co=256 
	set background=dark
	colors peaksea

endif
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" ignorar mayusculas al buscar
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
" set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" MAPEO DE TECLAS
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
" grabar rapido
nmap <leader>w :w!<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
" trata las linea sargas como lineas cortadas
map j gj
map k gk
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Mapeo para buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Close the current buffer and move to the previous one  This replicates the idea of closing a tab
nmap <leader>bc :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" configuracion teclas para nerdtree
"let NERDTreeMapOpenInTab='<ENTER>'
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeTabsToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" MRU plugin
let MRU_Max_Entries = 400
map <leader>vv :MRU<CR>

" Taglist Plugin
let Tlist_Use_Right_Window = 1
map <leader>bb :TlistToggle<cr>
""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
"set guifont=ter-powerline-v18n 
let g:airline_powerline_fonts = 1
let g:airline_theme             = 'bubblegum'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
