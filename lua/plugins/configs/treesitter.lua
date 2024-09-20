local options = {
  ensure_installed = { "lua", "vim", "vimdoc", "python", "bash", "markdown", "regex" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["at"] = "@comment.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      -- goto_next_start = {
      --   ["nf"] = "@function.outer",
      --   ["nc"] = "@class.outer",
      -- },
      -- goto_next_end = {
      --   ['nfe'] = '@function.outer',
      --   ['nce'] = '@class.outer',
      -- },
      -- goto_previous_start = {
      --   ["nF"] = "@function.outer",
      --   ["nC"] = "@class.outer",
      -- },
      -- goto_previous_end = {
      --   ['nfE'] = '@function.outer',
      --   ['ncE'] = '@class.outer',
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      -- goto_next_end = {
      --   ['nF'] = '@function.outer',
      --   ['nC'] = '@class.outer',
      -- },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      -- goto_previous_end = {
      --   ['[M'] = '@function.outer',
      --   ['[]'] = '@class.outer',
      -- },
      -- goto_next = {
      --   [']i'] = "@conditional.inner",
      -- },
      -- goto_previous = {
      --   ['[i'] = "@conditional.inner",
      -- }
    },
    swap = {
      enable = true,
      -- swap_next = {
      --   ["<leader>a"] = "@parameter.inner",
      -- },
      -- swap_previous = {
      --   ["<leader>A"] = "@parameter.inner",
      -- },
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}

return options
