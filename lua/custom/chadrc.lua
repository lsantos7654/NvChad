---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightfox",
  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.wo.relativenumber = true
vim.diagnostic.config {
  virtual_text = false,
}
return M
