return {
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-surround").setup()
  --   end,
  -- },
  -- {
  --   "tummetott/unimpaired.nvim",
  --   config = function()
  --     require("unimpaired").setup()
  --   end,
  -- },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>cs",
        function()
          require("treesj").toggle()
        end,
        desc = "Split/Join Block",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({ use_default_keymaps = false })
    end,
  },
}
