-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'folke/tokyonight.nvim'
    use 'christoomey/vim-tmux-navigator'
    use 'szw/vim-maximizer'
    use 'tpope/vim-surround'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim' 
    use 'neovim/nvim-lspconfig' 
    use 'hrsh7th/cmp-nvim-lsp' 
    use 'glepnir/lspsaga.nvim'
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use 'akinsho/flutter-tools.nvim'
    use 'ixru/nvim-markdown'
    use 'ggandor/leap.nvim'
    use 'windwp/nvim-autopairs' 
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) 
    use 'lewis6991/gitsigns.nvim' 

    if packer_bootstrap then
        require("packer").sync()
    end
end)
