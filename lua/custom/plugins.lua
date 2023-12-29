local leet_arg = "leetcode.nvim"

local plugins = {
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    config = function()
      require("image").setup {
        backend = "kitty",
      }
    end,
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
  },
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
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
  {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    require("core.utils").load_mappings "harpoon",
    config = function(_, opts)
      local harpoon = require "harpoon"
      harpoon:setup()
    end,
  },
  {
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    require("core.utils").load_mappings "GPT",
    config = function()
      require("chatgpt").setup {
        async_api_key_cmd = "pass show api/tokens/openai",
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function(_, opts)
      require("notify").setup {
        background_colour = "#333333",
      }
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",
      -- optional
      "nvim-treesitter/nvim-treesitter",
      -- "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = leet_arg ~= vim.fn.argv()[1],
    require("core.utils").load_mappings "leetcode",
    opts = {
      arg = leet_arg,
      lang = "python3",
      image_support = true,
    },
  },
  {
    "rcarriga/nvim-dap-ui",
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
    ft = { "python", "lua" },
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
