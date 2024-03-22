return {
  { "tpope/vim-rails" },
  { "slim-template/vim-slim" },
  { "AndrewRadev/splitjoin.vim" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "tummetott/unimpaired.nvim",
    config = function()
      require("unimpaired").setup({
        -- add any options here or leave empty
      })
    end,
  },
}
