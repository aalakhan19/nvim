set number relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set noswapfile
set nobackup
set incsearch
set scrolloff=4
set ignorecase
set smartcase

call plug#begin()
Plug 'navarasu/onedark.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

syntax on
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
let g:svelte_preprocessors = ['typescript']

let mapleader = " "
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>p :PlugInstall<cr>
