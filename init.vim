" plugins

call plug#begin()

""" reabrir a la ultima posicion
Plug 'farmergreg/vim-lastplace'

""" que te ponga {} cuando pulsas {
Plug 'jiangmiao/auto-pairs'

""" cuando abres un nuevo fichero con :e si no existe la ruta la crea
Plug 'pbrisbin/vim-mkdir'

""" comenta cosas:
" con gcc, gcap para comentar un parrafo, :7,17Commentary pa comentar
" gcgc descomenta
Plug 'tpope/vim-commentary'

""" rellena con texto los lenguajes que requieren de ello como if endif
Plug 'tpope/vim-endwise'

""" pone la linea de abajo bonita
Plug 'itchyny/lightline.vim'

""" autoguardado
Plug '907th/vim-auto-save'

""" color
Plug 'cocopon/iceberg.vim'

""" fuzzy finder el buscador de ficheros
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"" integracion con git //TODO: configurar
"Plug 'airblade/vim-gitgutter'

""" permite ejecutar desde vim. //TODO: configurar
"Plug 'thinca/vim-quickrun'

""" pila de :Yanks //TODO: configurar
"Plug 'maxbrunsfeld/vim-yankstack'

""" autocompletado parte1 //TODO: configurar
"Plug 'dense-analysis/ale'
""" idioma
"Plug 'sheerun/vim-polyglot' 
""" autocompletado parte2
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""" tabnine
""Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh'  }

call plug#end()




"" --- CONFIGURACION DE VIM --- ""

""" propio editor

set swapfile "guarda un .swp por si peta algo
set tildeop "hace que pueda escribir ~
set ttyfast "que vuele
set wildmenu "autocompletado de comandos
set wildmode=full
filetype plugin indent on "que gestione bien la extension q abres

""" espaciado

set autoindent
set list
set shiftround
set smartindent
set smarttab

""" apariencia

syntax on
set backspace=indent,eol,start
set colorcolumn=80
set completeopt=menu
set cursorline
set hlsearch
set inccommand=nosplit
set incsearch
set number
set relativenumber
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set wrap "que parta bien la linea si no cabe en pantalla

""" teclas

" espacio algo asi se que es customizacion mia
let g:mapleader = "\<space>"

" quitar el highlight de la busqueda con esc esc
nnoremap <esc><esc> :nohlsearch<cr>

"" --- CONFIGURACION DE LOS PLUGINS --- ""

"""pa los q necesiten python
"let g:python3_host_prog=/path/to/python/executable/

""" gitgutter
"let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

""" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>

""" auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

""" lightline
let g:lightline = { 'colorscheme': 'iceberg' }

""" colorscheme
colorscheme iceberg
highlight Normal      ctermbg=none
highlight NonText     ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight VertSplit   cterm=none ctermfg=240 ctermbg=240
