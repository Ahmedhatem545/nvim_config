-- Options
-- Options
vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')

-- Ensure Mason-installed binaries are on PATH so null-ls can find formatters
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if vim.fn.isdirectory(mason_bin) == 1 then
   vim.env.PATH = mason_bin .. ":" .. (vim.env.PATH or "")
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
   })

   if vim.v.shell_error ~= 0 then
      error("Failed to clone lazy.nvim:\n" .. out)
   end
end

vim.opt.rtp:prepend(lazypath)

-- Plugins

-- Load plugins safely
require("lazy").setup("plugins")
