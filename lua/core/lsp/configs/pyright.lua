local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

local on_attach = function(client, bufnr)
  client.server_capabilities.completionProvider = false
end

local function find_venv_path(startpath)
  local venv_path = startpath .. "/.venv"
  local exists = vim.fn.glob(venv_path) ~= ""
  if exists then
    return venv_path
  else
    return nil
  end
end

local function on_new_config(new_config, new_root_dir)
  local venv_path = find_venv_path(new_root_dir)
  if venv_path then
    -- Update the Python interpreter path
    new_config.settings.python.pythonPath = venv_path .. "/bin/python"
  end
end

return {
  capabilities = capabilities,
  on_new_config = on_new_config,
  handlers = {
    ["textDocument/publishDiagnostics"] = function(...) end,
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
      root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
      }
    }
  }
}
