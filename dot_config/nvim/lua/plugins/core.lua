return {
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
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          laststatus = 0,
          wrap = true,
        },
        kitty = {
          enabled = true,
          font = "+4",
        },
        tmux = { enabled = false },
      },
    },
  },
  { "folke/twilight.nvim" },
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
  { "mpas/marp-nvim" },
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
        html = { "prettier" },
        javascript = { "standardjs" },
        json = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
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
      spec = {
        { "<leader>r", group = "rails" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        },
        ["neotest-minitest"] = {
          -- NOTE: By default neotest-minitest uses the `bundle exec ruby -Itest`
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        },
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
