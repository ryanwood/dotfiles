-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fw", ":w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })

vim.keymap.set("n", "zx", "zMzvzz", { desc = "Refocus folds" })

-- Missing unimpaired space mapping
vim.keymap.set("n", "[<space>", "O<Esc>j", { desc = "Add line above" })
vim.keymap.set("n", "]<space>", "o<Esc>k", { desc = "Add line below" })
vim.keymap.set("n", "[p", ":put!<CR>", { desc = "Paste linewise above" })
vim.keymap.set("n", "]p", ":put<CR>", { desc = "Paste linewise below" })

-- Rails
vim.keymap.set("n", "<leader>rc", ":Econtroller<cr>", { desc = "Rails: Go to controller" })
vim.keymap.set("n", "<leader>rv", ":Eview<cr>", { desc = "Rails: Go to view" })
vim.keymap.set("n", "<leader>rm", ":Emodel ", { desc = "Rails: Go to model" })
vim.keymap.set("n", "<leader>re", ":Extract ", { desc = "Rails: Extract partial" })

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Move windows
vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = "Move Window Left" })
vim.keymap.set("n", "<leader>wj", "<C-w>J", { desc = "Move Window Down" })
vim.keymap.set("n", "<leader>wk", "<C-w>K", { desc = "Move Window Up" })
vim.keymap.set("n", "<leader>wl", "<C-w>L", { desc = "Move Window Right" })
vim.keymap.set("n", "<leader>wo", "<cmd>only<cr>", { desc = "Close all but Current Window" })

-- Fix split to use the "\" vs "|"" so you don't need shift
vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>\\", "<C-w>v", { desc = "Split Window Right", remap = true })

-- Tabs
vim.keymap.set("n", "<leader><tab>s", "<cmd>tab split<cr>", { desc = "Split buffer into tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close all tabs but current" })

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to the left" })
vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the right" })
vim.keymap.set(
  "n",
  "<leader>b{",
  "<cmd>lua require('bufferline').move_to(1)<cr>",
  { desc = "Move buffer to the first" }
)
vim.keymap.set(
  "n",
  "<leader>b}",
  "<cmd>lua require('bufferline').move_to(-1)<cr>",
  { desc = "Move buffer to the last" }
)
