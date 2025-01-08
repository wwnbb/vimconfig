capabilities.textDocument.completion

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion = nil
capabilities.textDocument.declaration = nil
capabilities.textDocument.definition = nil
capabilities.textDocument.typeDefinition = nil
capabilities.textDocument.references = nil
capabilities.textDocument.rename = nil

return {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    settings = {
      args = {},
    }
  }
}
