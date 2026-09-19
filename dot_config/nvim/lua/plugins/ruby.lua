return {
  {
    "tpope/vim-rails",
    config = function()
      -- This was causing htmlbeatuifier to format yaml files which broke them...
      -- disable autocmd set filetype=eruby.yaml
      -- https://www.reddit.com/r/neovim/comments/z7vqgu/syntax_highlighting_for_erubyyaml_with_railsvim/
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
        pattern = { "*.yml" },
        callback = function()
          vim.bo.filetype = "yaml"
        end,
      })
    end,
  },
  { "tpope/vim-liquid" },
  { "slim-template/vim-slim" },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "rails" },
      },
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>cj",
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
