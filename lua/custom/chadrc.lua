---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.wo.relativenumber = true
vim.diagnostic.config {
  virtual_text = false,
}

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
return M
