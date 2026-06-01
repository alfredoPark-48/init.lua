-- Project View / Backtrack to native explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Backtrack to Explorer" })

-- Open Neo-tree and reveal the current file location (IF NEO-TREE INSTALLED)
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree reveal<cr>", { desc = "Backtrack to Explorer" })

-- Essential line movements & editor shortcuts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard protection
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without losing yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Clear search highlighting easily
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quick window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
