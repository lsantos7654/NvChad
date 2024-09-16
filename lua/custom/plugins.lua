local leet_arg = "leetcode.nvim"

local plugins = {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      mappings = {
        ask = "<A-a>", -- ask
      },
      hints = { enabled = true },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    require("core.utils").load_mappings "auto",
    config = function()
      require("auto-session").setup {
        auto_restore = true,
        auto_save = true,
        enabled = true,
        log_level = "error",
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  -- {
  --   "kawre/leetcode.nvim",
  --   build = ":TSUpdate html",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/plenary.nvim", -- required by telescope
  --     "MunifTanjim/nui.nvim",
  --     -- optional
  --     "nvim-treesitter/nvim-treesitter",
  --     -- "rcarriga/nvim-notify",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   lazy = leet_arg ~= vim.fn.argv()[1],
  --   require("core.utils").load_mappings "leetcode",
  --   opts = {
  --     arg = leet_arg,
  --     lang = "python3",
  --   },
  -- },
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
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
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
    keys = require("core.utils").load_mappings "window",
    opts = {
      auto_enable = false,
      screen_bounds = "background",
      window_border = "solid",
    },
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
    ft = { "python", "lua", "cpp", "json", "sh", "bash", "zsh" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "html-lsp",
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
        "shellcheck",
        "shfmt",
        "bash-language-server",
        "eslint-lsp",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("null-ls").setup(require "custom.configs.null-ls")
    end,
  },
}
return plugins
