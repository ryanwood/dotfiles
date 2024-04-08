-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>z", "zMzvzz", { desc = "Refocus folds" })
vim.keymap.set("n", "<leader>fw", ":w<cr>", { desc = "Write file" })

vim.keymap.set("n", "[<space>", "O<Esc>j", { desc = "Add line above" })
vim.keymap.set("n", "]<space>", "o<Esc>k", { desc = "Add line below" })
vim.keymap.set("n", "[l", "ddkP", { desc = "Swap with line above" })
vim.keymap.set("n", "]l", "ddp", { desc = "Swap with line below" })

vim.keymap.set("n", "<leader>rc", ":Econtroller<cr>", { desc = "Rails: Go to controller" })
vim.keymap.set("n", "<leader>rv", ":Eview<cr>", { desc = "Rails: Go to view" })
vim.keymap.set("n", "<leader>rm", ":Emodel ", { desc = "Rails: Go to model" })
vim.keymap.set("n", "<leader>re", ":Extract ", { desc = "Rails: Extract partial" })

vim.keymap.set("n", "<leader><tab>s", "<cmd>tab split<cr>", { desc = "Split buffer into tab" })
