require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end


-- start with nvim toggled
-- vim.cmd([[autocmd VimEnter * NvimTreeToggle]])

function ToggleNvimTreeAndClear()
    -- Toggle NvimTree visibility
    vim.cmd("NvimTreeToggle")
    -- -- Go to the next buffer
    -- vim.cmd("wincmd l")
    -- -- Redraw the screen
    -- vim.cmd("redraw!")
end

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = ToggleNvimTreeAndClear
})

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
