return {
  -- Remove defaults
  -- Bufferline is just too noisy up top
  { "akinsho/bufferline.nvim", enabled = false },

  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- Improved split border color. See https://github.com/folke/tokyonight.nvim/discussions/453
    opts = {
      on_colors = function(colors)
        colors.border = colors.blue7
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- UI Improvements
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
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
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fd", "<cmd>Telescope find_files cwd=%:p:h<cr>", desc = "Find files (dir of current file)" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
          n = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
        },
      },
    },
  },

  -- Rails Development
  { "tpope/vim-rails" },
  { "tpope/vim-liquid" },
  { "slim-template/vim-slim" },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        htmlbeautifier = {
          prepend_args = { "-b", "1" },
        },
      },
      formatters_by_ft = {
        eruby = { "htmlbeautifier" },
        javascript = { "standardjs" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        eruby = { "erb_lint" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>r"] = { name = "+rails" },
      },
    },
  },

  -- Load custom snippets
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
    end,
  },

  -- Play nice with tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
