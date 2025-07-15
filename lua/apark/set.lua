-- Make insert mode cursor THICC
vim.opt.guicursor = ""

-- Displays line numbers
vim.opt.nu = true

-- Displays relative line numbers
vim.opt.relativenumber = true

-- Set tab to 2 spaces
vim.opt.tabstop = 2

-- Set Vim tab insertion to 2
vim.opt.softtabstop = 2

-- Set indentation width to 2
vim.opt.shiftwidth = 2

-- Replace tab with spaces when inserting or editing text
vim.opt.expandtab = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Sets color column for maximum line length
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = '#2a2a2a' })
vim.opt.colorcolumn = "80"

-- Sets scroll offset (Number of lines to keep above or below when scrolling)
vim.opt.scrolloff = 8

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
