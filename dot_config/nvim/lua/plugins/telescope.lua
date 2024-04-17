return {
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
}
