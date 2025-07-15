-- Remap leader key as space bar (default: '\')
vim.g.mapleader = " "

-- Remap exit command (default: ':Ex')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- J moves selected line down and K moves selected line up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Scrolls half pages and keeps cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Greatest remap ever, deletes selected text and pastes contents
-- of the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Next greatest remap ever: For normal and visual mode,
-- yanks selected text into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })

-- Allow Neovim to use system clipboard
vim.opt.clipboard = "unnamedplus"
vim.cmd('set clipboard=unnamedplus')
