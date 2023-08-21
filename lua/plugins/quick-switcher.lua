local openTestFile = function()
  local currentPath = vim.fn.getcwd()
  local options = { regex = true, path = currentPath, maxdepth = 3 }
  require("nvim-quick-switcher").find(".+_test|.+Tests|.+Test|.+\\.test", options)
end

local openViewModelFile = function()
  local currentPath = vim.fn.getcwd()
  require("nvim-quick-switcher").find(".+_notifier\\.", {
    regex = true,
    reverse = false,
    path = currentPath,
    maxdepth = 4,
    prefix = "long",
  })
end

local openViewFile = function()
  local currentPath = vim.fn.getcwd()
  require("nvim-quick-switcher").find(".+_page\\.", {
    regex = true,
    reverse = false,
    path = currentPath,
    maxdepth = 4,
    prefix = "long",
  })
end

return {
  "DanielCardonaRojas/nvim-quick-switcher",
  keys = {
    { "<localleader>t", openTestFile, desc = "Open test file" },
    { "<localleader>v", openViewFile, desc = "Open view file" },
    { "<localleader>m", openViewModelFile, desc = "Open model file" },
  },
}
