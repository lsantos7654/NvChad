local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "find_replace" },
    ["n"] = { "nzzzv", "next search result center screen" },
    ["N"] = { "Nzzzv", "previous search result center screen" },
    ["<leader>d'"] = { ":delmarks a-zA-Z<CR>", "Delete All Marks" },
    ["<C-w>a"] = {":qall<CR>", "Quit Nvim"},
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move text down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move text up" },
  },
}

M.git = {
  plugin = true,
  n = {
    ["<leader>gh"] = { ":G<CR>:only<CR>", "Open Git" },
    ["<leader>gl"] = { ":G log --graph --abbrev-commit --decorate<CR>:only<CR>", "Git Log" },
  },
}

M.window = {
  plugin = true,
  n = {
    ["<leader>mm"] = {
      function()
        require("codewindow").toggle_minimap()
      end,
      "toggle minimap",
    },
    ["<leader>mf"] = {
      function()
        local codewindow = require "codewindow"
        codewindow.toggle_focus()
        IS_FOCUS = not IS_FOCUS
        if IS_FOCUS then
          vim.o.scrolloff = 999 -- High value for centering cursor
        else
          vim.o.scrolloff = 8 -- Or your preferred default value
        end
        -- vim.cmd "normal zz"
      end,
      "toggle focus and center cursor",
    },
  },
}

M.GPT = {
  plugin = true,
  n = {
    ["<leader>gr"] = { ":ChatGPTRun ", "ChatGPT Run" },
    ["<leader>gg"] = { ":ChatGPT", "ChatGPT" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      function()
        require("dap").continue()
      end,
      "run debugger",
    },
  },
}

M.tabufline = {
  n = {
    ["<C-t>"] = { ":tabedit<CR>", "open new tab" },
    ["<A-t>"] = { ":tabclose<CR>", "close tab" },
    ["<leader>="] = { ":wincmd =<CR>", "Equalize windows" },
  },
}

-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpt"] = {
--       function()
--         require("dap-python").test_method()
--       end,
--       "run debugger with test",
--     },
--   },
-- }

return M
