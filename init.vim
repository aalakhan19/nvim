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
set nohlsearch
set completeopt=menu,menuone,noselect

call plug#begin()
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "typescript", "svelte", "javascript" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
    },
    mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(select_opts),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<Esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup {
    capabilities = capabilities
}
vim.diagnostic.config({
  severity_sort = true,
  signs = false,
})
EOF

syntax on
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
let g:svelte_preprocessors = ['typescript']

let mapleader = " "
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>p :so %<cr>:PlugInstall<cr>
nnoremap <leader>c :e ~/.config/nvim/init.vim<cr>
