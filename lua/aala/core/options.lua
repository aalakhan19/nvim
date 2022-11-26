local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split buffers
opt.splitbelow = true
opt.splitright = true

-- swapfiles
opt.swapfile = false

opt.iskeyword:append("-")
