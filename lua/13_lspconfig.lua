vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]]



require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if server_name == "pyright" then
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

      require('lspconfig')['pyright'].setup {
        capabilities = capabilities,
        on_attach = function(client, buffer)
          client.handlers["textDocument/publishDiagnostics"] = function(...) end
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            }
          }
        }
      }
    else
      require("lspconfig")[server_name].setup {}
    end
  end,
}

-- linting and formatting
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
    },
})

-- AutoFormatting
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
