return {
  "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/my-snippets/" } })
  end,
}
