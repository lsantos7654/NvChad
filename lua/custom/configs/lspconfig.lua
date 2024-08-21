local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

lspconfig.pyright.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.jsonls.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "json" },
}

lspconfig.bashls.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "bash", "zsh", "sh" },
}

lspconfig.clangd.setup {
  autostart = false,
  on_attach = on_attach,
  -- on_attach = function(client, bufnr)
  --   client.server_capabilities.signatureHelpProvider = false
  --   on_attach(client, bufnr)
  -- end,
  capabilities = capabilities,
  filetypes = { "cpp" },
}

lspconfig.eslint.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

local null_ls = require "null-ls"
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
    },
  },
}
