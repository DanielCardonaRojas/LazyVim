-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[ autocmd CursorHold * :lua vim.diagnostic.open_float() ]])
vim.cmd([[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]])

-- Backup Notes Vaults on save
local vaultPath = vim.fn.expand("~") .. "/NotesVault"

local backupVault = function(event)
  local command = "git add . && commit_or_amend.sh && git push -f"
  vim.fn.jobstart(command, {
    cwd = vaultPath,
  })
end

local syncVault = function(event)
  local command = "git pull"
  vim.fn.jobstart(command, {
    cwd = vaultPath,
    on_exit = function()
      vim.cmd("edit!")
    end,
  })
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vaultPath .. "/*.md",
  group = vim.api.nvim_create_augroup("NotesVaultBackup", { clear = true }),
  callback = backupVault,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = vaultPath .. "/*.md",
  group = vim.api.nvim_create_augroup("NotesVaultSync", { clear = true }),
  callback = syncVault,
})
