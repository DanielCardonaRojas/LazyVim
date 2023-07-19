-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "vil", "g_v^", { desc = "Select inner line" })
map("c", "<c-j>", "<c-n>")
map("c", "<c-k>", "<c-p>")

local homeDir = os.getenv("HOME")

map("n", "<leader>gg", function()
  Util.float_term({
    "lazygit",
    "-ucf",
    homeDir .. "/.config/lazygit/config.yml" .. "," .. homeDir .. "/.config/lazygit/catppuccin/frappe.yml",
  }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

map("n", "<leader>gG", function()
  Util.float_term({
    "lazygit",
    "-ucf",
    homeDir .. "/.config/lazygit/config.yml" .. "," .. homeDir .. "/.config/lazygit/catppuccin/frappe.yml",
    "--git-dir=" .. homeDir .. "/.cfg",
    "--work-tree=" .. homeDir,
  }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

map("n", "<leader>ot", function()
  local currentPath = vim.fn.getcwd()
  local options = { regex = true, path = currentPath, split = "vertical", maxdepth = 4 }
  require("nvim-quick-switcher").find(".+_test|.+Tests|.+Test|.+\\.test", options)
end, { noremap = true, silent = true, desc = "Open test file" })

map("n", "<leader>om", function()
  local currentPath = vim.fn.getcwd()
  require("nvim-quick-switcher").find(".+_notifier\\.", {
    regex = true,
    reverse = false,
    path = currentPath,
    maxdepth = 4,
    prefix = "long",
  })
end, { noremap = true, silent = true, desc = "Open model file" })

map("n", "<leader>ov", function()
  local currentPath = vim.fn.getcwd()
  require("nvim-quick-switcher").find(".+_page\\.", {
    regex = true,
    reverse = false,
    path = currentPath,
    maxdepth = 4,
    prefix = "long",
  })
end, { noremap = true, silent = true, desc = "Open view file" })
