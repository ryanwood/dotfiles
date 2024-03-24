local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("eruby", {
  s("cc", {
    t("<!--<% if false %>"),
    i(1),
    t("<% end %>-->"),
  }),
})
