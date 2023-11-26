-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if type(lhs) == "table" then
    for _, bind in ipairs(lhs) do
      if not keys.active[keys.parse({ bind, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, bind, rhs, opts)
      end
    end
  else
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
      opts = opts or {}
      opts.silent = opts.silent ~= false
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

map("n", "vil", "g_v^", { desc = "Select inner line" })
map("c", "<c-j>", "<c-n>")
map("c", "<c-k>", "<c-p>")

local homeDir = os.getenv("HOME")

map("n", "<leader>gg", function()
  Util.terminal.open({
    "lazygit",
    "-ucf",
    homeDir .. "/.config/lazygit/config.yml" .. "," .. homeDir .. "/.config/lazygit/catppuccin/frappe.yml",
  }, { cwd = Util.root.get(), esc_esc = false, ctrl_hjkl = false, border = "rounded" })
end, { desc = "Lazygit (root dir)" })

map("n", "<leader>gG", function()
  Util.terminal.open({
    "lazygit",
    "-ucf",
    homeDir .. "/.config/lazygit/config.yml" .. "," .. homeDir .. "/.config/lazygit/catppuccin/frappe.yml",
    "--git-dir=" .. homeDir .. "/.cfg",
    "--work-tree=" .. homeDir,
  }, { esc_esc = false, ctrl_hjkl = false, border = "rounded" })
end, { desc = "Lazygit (cwd)" })

local lazyterm = function()
  Util.terminal.open(nil, { cwd = Util.root.get(), border = "rounded" })
end

map({ "n", "i", "t" }, "<c-x>", lazyterm, { desc = "Open floating terminal" })
