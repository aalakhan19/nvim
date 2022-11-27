vim.g.mapleader = " "

local keymap = vim.keymap
-- buffer windows
keymap.set("n", "<leader>sv", "<C-w>s") -- Vertical split
keymap.set("n", "<leader>sh", "<C-w>v") -- Horizontal split
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("t", "<esc>", "<C-\\><C-N>")
keymap.set("n", "<leader>t", ":terminal<CR>")
-- plugin keymaps

-- vim maximazier
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>")
