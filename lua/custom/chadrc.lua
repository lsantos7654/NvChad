---@type ChadrcConfig
local M = {}

-- UI configuration
M.ui = {
  theme = "gatekeeper",
  transparency = true,
}

-- Plugin and mapping configurations
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Vim options
local function set_options()
  vim.wo.relativenumber = true
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

  -- Set shiftwidth to 0 for all filetypes
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal shiftwidth=0",
  })
end

-- Lua rocks configuration
local function setup_luarocks()
  local home = vim.fn.expand "$HOME"
  package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.1/?/init.lua;"
  package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.1/?.lua;"
end

-- Initialize everything
local function init()
  set_options()
  setup_luarocks()
end

init()

-- Custom remapping
-- vim.api.nvim_set_keymap("n", "0", "$", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "9", "^", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "8", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "p", ":pu<CR>]==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "P", ":pu!<CR>]==", { noremap = true, silent = true })

return M
