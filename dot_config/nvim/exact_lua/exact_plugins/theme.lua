return {
  { "catppuccin", enabled = false },
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
}
