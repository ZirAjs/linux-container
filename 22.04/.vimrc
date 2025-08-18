" ------------------------
" Pretty and Productive Vim
" ------------------------

" Appearance
set number                  " Show line numbers
set relativenumber          " Show relative line numbers
set cursorline              " Highlight the current line
syntax on                   " Enable syntax highlighting
filetype plugin indent on   " Enable filetype-specific plugins and indentation

" UI enhancements
set showcmd                 " Show command in bottom bar
set showmode                " Show current mode
set laststatus=2            " Always show status line
set wildmenu                " Visual autocomplete for command menu
set lazyredraw              " Faster scrolling

" Indentation
set tabstop=4               " Number of spaces per <Tab>
set shiftwidth=4            " Number of spaces for auto-indent
set expandtab               " Convert tabs to spaces
set smartindent             " Smart auto-indenting
set autoindent              " Auto-indent new lines

" Searching
set ignorecase              " Case-insensitive search...
set smartcase               " ...unless capital letter used
set incsearch               " Show matches while typing
set hlsearch                " Highlight search matches

" Colors (use a nicer theme if available)
set background=dark
colorscheme desert          " Change this if you have a preferred colorscheme

" Better splits
set splitbelow              " Horizontal splits open below
set splitright              " Vertical splits open right

" Clipboard (requires +clipboard Vim build)
" set clipboard=unnamedplus  " Use system clipboard (if supported)

" Python-specific settings
autocmd FileType python setlocal omnifunc=python3complete#Complete

" File type overrides
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Key mappings (use <leader> space to clear search highlights)
nnoremap <leader><space> :nohlsearch<CR>

" Automatically reload files changed outside of Vim
set autoread
autocmd FocusGained,BufEnter * checktime
