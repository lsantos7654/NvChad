local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "find_replace" },
    ["n"] = { "nzzzv", "next search result center screen" },
    ["N"] = { "Nzzzv", "previous search result center screen" },
    ["<leader>d'"] = { ":delm!<CR>", "Delete All Marks" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move text down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move text up" },
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

M.leetcode = {
  plugin = true,
  n = {
    ["<leader>lt"] = { ":Leet test<CR>", "run test cases" },
    ["<leader>lr"] = { ":Leet submit<CR>", "submit" },
    ["<leader>ld"] = { ":Leet desc<CR>", "toggle description" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
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

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
      "Add file to Harpoon",
    },
    ["<leader>cch"] = {
      function()
        require("harpoon"):list():clear()
      end,
      "Clear Harpoon",
    },
    ["<C-e>"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Toggle Harpoon menu",
    },

    ["<leader>1"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Navigate to Harpoon file 1",
    },
    -- ["<leader>!"] = {
    --   function()
    --     require("harpoon"):list():append(4)
    --   end,
    --   "Add file to Harpoon",
    -- },

    ["<leader>2"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Navigate to Harpoon file 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Navigate to Harpoon file 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Navigate to Harpoon file 4",
    },
  },
}

return M