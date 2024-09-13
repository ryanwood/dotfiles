return {
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
}
