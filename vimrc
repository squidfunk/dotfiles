execute pathogen#infect()
syntax on
filetype plugin indent on
set background=dark
colorscheme dracula

" Searching
set hlsearch                                " Highlight searches
set incsearch                               " Highlight search results instantly
set ignorecase                              " Ignore case
set smartcase                               " Override 'ignorecase' option if the search contains upper case characters.

" Indentation
set shiftwidth=2                            " Number of spaces to use in each autoindent step
set tabstop=2                               " Two tab spaces
set softtabstop=2                           " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                               " Spaces instead of tabs for better cross-editor compatibility
set autoindent                              " Keep the indent when creating a new line
set smarttab                                " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                 " Recommended seting for automatic C-style indentation
set autoindent                              " Automatic indentation in non-C files


let g:is_posix = 1                          " Better highlighting of shell files

filetype plugin indent on                   " Enable automatic filetype detection, filetype-specific plugins/indentation

" Misc
set nowrap                                  " I don't always wrap lines...
set linebreak                               " ...but when I do, I wrap whole words.
set t_Co=256                                " Support for xterm with 256 colors
set number                                  " Show line numbers
set ruler                                   " Show ruler
set noswapfile                              " Don't create annoying *.swp files
