return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "stylua",
      "marksman",
    },
    ui = {
      border = "rounded",
      height = 0.8,
    },
  },
}
