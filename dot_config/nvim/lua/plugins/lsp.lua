return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://github.com/ianchesal/dotfiles/blob/main/nvim/lua/plugins/nvim-lspconfig.lua#L32
        ruby_lsp = {
          cmd = { "mise", "exec", "--", "ruby-lsp" },
          -- init_options = { formatter = "auto", },
        },
        -- standardrb = {
        --   cmd = { "asdf", "exec", "standardrb" },
        -- },
      },
    },
  },
}
