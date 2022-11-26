local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    auto_install = true,
    sync_install = true,
})
