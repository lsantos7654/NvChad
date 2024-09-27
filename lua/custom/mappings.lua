local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["<leader>s"] = { [[:%s/\v(<C-r><C-w>)/\1/gI<Left><Left><Left>]], "find_replace" },
    ["<leader>s"] = { [[:%s/\v(<C-r><C-w>)//gI<Left><Left><Left>]], "find_replace" },
    ["n"] = { "nzzzv", "next search result center screen" },
    ["N"] = { "Nzzzv", "previous search result center screen" },
    ["<leader>d'"] = { ":delmarks a-zA-Z<CR>", "Delete All Marks" },
    ["<C-w>a"] = { ":qall<CR>", "Quit Nvim" },
    ["<C-n>"] = { ":qall<CR>", "Quit Nvim" },
    ["<leader>pd"] = { ":echo expand('%:p:h')<CR>", "Print file path" },
    ["<leader>ll"] = { ":LspStart<CR>", "Start LSP service" },
    ["<leader>lp"] = { ":LspStop<CR>", "Stop LSP service" },
    ["<A-d>"] = { "<C-e><C-e>", "Scroll window down" },
    ["<A-u>"] = { "<C-y><C-y>", "Scroll window up" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move text down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move text up" },
    ["<A-d>"] = { "<C-e><C-e>", "Scroll window down" },
    ["<A-u>"] = { "<C-y><C-y>", "Scroll window up" },
  },
  i = {
    ["<S-Tab>"] = { "<C-d>", "inverse tab" },
  },
}

M.git = {
  plugin = true,
  n = {
    ["<leader>gh"] = { ":G<CR>:only<CR>", "Open Git" },
    ["<leader>gl"] = { ":G log --graph --decorate<CR>:only<CR>", "Git Log" },
    ["<leader>hc"] = { "/[*] commit \\x\\+<CR>n", "highlight commits" },
  },
}

M.auto = {
  plugin = true,
  n = {
    ["<leader>fs"] = { ":SessionSave<CR>", "Save Session" },
    ["<leader>fR"] = { ":SessionRestore<CR>", "Restore Session" },
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

M.leetcode = {
  plugin = true,
  n = {
    ["<leader>lt"] = { ":Leet test<CR>", "run test cases" },
    ["<leader>lr"] = { ":Leet submit<CR>", "submit" },
    ["<leader>ld"] = { ":Leet desc<CR>", "toggle description" },
    ["<leader>lc"] = { ":Leet console<CR>", "toggle console" },
  },
}

M.avante = {
  plugin = true,
  n = {
    ["<A-a>"] = { ":AvanteAsk<CR>", "Open Avante Ask" },
  },
  v = {
    ["<A-a>"] = { ":AvanteAsk<CR>", "Open Avante Ask" },
  },
}

M.zen = {
  plugin = true,
  n = {
    ["<leader>z"] = { ":ZenMode<CR>", "Zen Mode" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ---continue
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Continue to next breakpoint" },
    --stepinto
    ["<leader>dj"] = { "<cmd> DapStepInto <CR>", "Step into function/Next" },
    --stepout
    ["<leader>dk"] = { "<cmd> DapStepOut <CR>", "Step out of function" },
    --stepover
    ["<leader>dJ"] = { "<cmd> DapStepOver <CR>", "Step over function/Next in buffer" },
    --terminate
    ["<leader>dq"] = { "<cmd> DapTerminate <CR>", "Exit" },
    ["<leader>dd"] = {
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
