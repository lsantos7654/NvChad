---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gatekeeper",
  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.wo.relativenumber = true
-- vim.diagnostic.config {
--   virtual_text = false,
-- }

-- Custom remapping
-- vim.api.nvim_set_keymap("n", "0", "$", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "9", "^", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "8", "0", { noremap = true, silent = true })

-- -- Better paste
-- vim.api.nvim_set_keymap('n', 'p', ':pu<CR>]==', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'P', ':pu!<CR>]==', { noremap = true, silent = true })
--
-- -- highlight commits
-- vim.api.nvim_set_keymap('n', '<leader>hc', '/[*] commit \\x\\+<CR>n', { noremap = true, silent = true })

-- start with nvim toggled
-- vim.cmd([[autocmd VimEnter * NvimTreeToggle]])

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
return M
