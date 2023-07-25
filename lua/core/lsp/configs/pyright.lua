local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

local on_attach = function(client, bufnr)
  client.server_capabilities.completionProvider = false
end

return {
  capabilities = capabilities,
  handlers = {
    ["textDocument/publishDiagnostics"] = function(...) end,
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      }
    }
  }
}
