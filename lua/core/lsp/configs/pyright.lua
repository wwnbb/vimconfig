local function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local pyrigth_capabilities = deepcopy(capabilities)

pyrigth_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

return {
  capabilities = pyrigth_capabilities,
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
