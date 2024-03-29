-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>z", "zMzvzz", { desc = "Refocus folds" })
vim.keymap.set("n", "<leader>fw", ":w<cr>", { desc = "Write file" })

vim.keymap.set("n", "[<space>", "O<Esc>j", { desc = "Add line above" })
vim.keymap.set("n", "]<space>", "o<Esc>k", { desc = "Add line below" })
vim.keymap.set("n", "[l", "ddkP", { desc = "Swap with line above" })
vim.keymap.set("n", "]l", "ddp", { desc = "Swap with line below" })
