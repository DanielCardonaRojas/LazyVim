return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    fast_wrap = {
      map = "<C-l>",
      manual_position = true,
    },
  }, -- this is equalent to setup({}) function
}
