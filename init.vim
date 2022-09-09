set fileformat=unix
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
set signcolumn=yes
set noshowmode
set splitbelow
set splitright

call plug#begin()
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
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
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
call plug#end()

lua << EOF
local servers = { 'tsserver', 'clangd', 'svelte', 'html', 'cssls', 'gdscript'}
require('lualine').setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "typescript", "svelte", "javascript", "html", "css", "markdown", "markdown_inline" },
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

  ['<C-c>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({select = true}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})


local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>df', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
  underline = true,
  virtual_text = false;
})

local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end
EOF

syntax on
set termguicolors
colorscheme tokyonight

let g:svelte_preprocessors = ['typescript']

let mapleader = " "
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>P <cmd>Telescope live_grep<cr>
nnoremap <leader>dd <cmd>Telescope diagnostics<cr>
nnoremap <leader>s :w<cr>

if has('unix')
  nnoremap <leader>c :e ~/.config/nvim/init.vim<cr> 
else
  nnoremap <leader>c :e ~\AppData\Local\nvim\init.vim<cr>
  set guifont=FiraCode\ NF:h11:ASCI
endif
