require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "typescript", "svelte", "javascript" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
