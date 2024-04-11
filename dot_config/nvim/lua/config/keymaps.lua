-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<D-s>", ":w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<esc>:w<cr>i", { desc = "Save file" })
vim.keymap.set("n", "<leader>fw", ":w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>z", "zMzvzz", { desc = "Refocus folds" })

vim.keymap.set("n", "[<space>", "O<Esc>j", { desc = "Add line above" })
vim.keymap.set("n", "]<space>", "o<Esc>k", { desc = "Add line below" })

vim.keymap.set("n", "<leader>rc", ":Econtroller<cr>", { desc = "Rails: Go to controller" })
vim.keymap.set("n", "<leader>rv", ":Eview<cr>", { desc = "Rails: Go to view" })
vim.keymap.set("n", "<leader>rm", ":Emodel ", { desc = "Rails: Go to model" })
vim.keymap.set("n", "<leader>re", ":Extract ", { desc = "Rails: Extract partial" })

vim.keymap.set("n", "<leader><tab>s", "<cmd>tab split<cr>", { desc = "Split buffer into tab" })

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = "Move Window Left" })
vim.keymap.set("n", "<leader>wj", "<C-w>J", { desc = "Move Window Down" })
vim.keymap.set("n", "<leader>wk", "<C-w>K", { desc = "Move Window Up" })
vim.keymap.set("n", "<leader>wl", "<C-w>L", { desc = "Move Window Right" })

-- Fix split to use the "\" vs "|"" so you don't need shift
vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>\\", "<C-w>v", { desc = "Split Window Right", remap = true })
