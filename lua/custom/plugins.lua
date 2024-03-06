local leet_arg = "leetcode.nvim"

local plugins = {
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup {}
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function(_, opts)
      require("core.utils").load_mappings "git"
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    require("core.utils").load_mappings "window",
    config = function()
      local codewindow = require "codewindow"
      codewindow.setup {
        auto_enable = false,
        screen_bounds = "background",
        window_border = "solid",
      }
    end,
  },
  -- {
  --   "dreamsofcode-io/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   require("core.utils").load_mappings "GPT",
  --   config = function()
  --     require("chatgpt").setup {
  --       async_api_key_cmd = "pass show api/tokens/openai",
  --     }
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    config = function(_, opts)
      require("notify").setup {
        background_colour = "#333333",
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python", "lua", "cpp", "json" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "debugpy",
        "ruff",
        "mypy",
        "black",
        "stylua",
        "clangd",
        "clang-format",
        "codelldb",
        "lua-language-server",
        "json-lsp",
        "fixjson",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
