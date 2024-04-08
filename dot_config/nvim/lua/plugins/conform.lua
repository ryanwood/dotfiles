return {
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
}
