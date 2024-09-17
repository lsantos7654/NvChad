local null_ls = require "null-ls"

local opts = {
  sources = {
    -- Python Setup
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    -- null_ls.builtins.diagnostics.pyright,

    -- Lua Setup
    null_ls.builtins.formatting.stylua,

    -- C++
    null_ls.builtins.formatting.clang_format,

    -- Json
    null_ls.builtins.formatting.fixjson,

    -- bash
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,

    -- HTML
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "html", "css", "javascript", "typescript", "json" },
    },
  },
  -- Auto Formatting
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
