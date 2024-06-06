local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("eruby", {
  s("cc", {
    t("<!--<% if false %>"),
    i(1),
    t("<% end %>-->"),
  }),

  -- Turbo
  s(
    { trig = "tft", dscr = "turbo_frame_tag" },
    fmt(
      [[
        <%= turbo_frame_tag {} do %>
          {}
        <% end %>
      ]],
      { i(1, "model"), i(2) }
    )
  ),
  s({ trig = "tsf", dscr = "turbo_stream_from" }, {
    t("<%= turbo_stream_from "),
    i(1, "model"),
    t(" %>"),
  }),
})

ls.add_snippets("ruby", {
  s(
    { trig = "desc", dscr = "describe block" },
    fmt(
      [[
        describe "{}" do
          {}
        end
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = "it", dscr = "it block" },
    fmt(
      [[
        it "{}" do
          {}
        end
      ]],
      { i(1), i(2) }
    )
  ),
})
