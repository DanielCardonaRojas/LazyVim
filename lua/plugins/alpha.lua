return {
  "goolord/alpha-nvim",
  opts = function()
    local logo = [[






    ]]

    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = vim.split(logo, "\n")
    return dashboard
  end,
}
