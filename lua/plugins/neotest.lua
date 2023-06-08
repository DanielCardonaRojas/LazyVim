return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "vim-test/vim-test",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-plenary",
    "sidlatau/neotest-dart",
  },
  keys = {
    { "<leader>tN", ':lua require("neotest").run.run() <CR>', desc = "Test nearest" },
    { "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%")) <CR>', desc = "Test file" },
    { "<leader>ts", ':lua require("neotest").summary.toggle() <CR>', desc = "Tests summary" },
    { "<leader>tt", ":TestFile <CR>", desc = "Test file (vim-test)" },
    { "<leader>tl", ":TestLast <CR>", desc = "Test last (vim-test)" },
    { "<leader>tn", ":TestNearest <CR>", desc = "Test nearest (vim-test)" },
  },
  init = function() end,
  config = function()
    require("neotest").setup({
      icons = {
        running = "喇",
        passed = "",
        unknown = "",
        failed = "",
        skipped = "ﰸ",
      },
      adapters = {
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
        require("neotest-dart")({
          command = "fvm flutter",
          -- command = "dart",
          use_lsp = true,
        }),
      },
    })
  end,
}
