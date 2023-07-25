-- Auto loading lsp servers for mason
local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

local lspconfig = require 'lspconfig'

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local server = lspconfig[server_name]
    -- Attempt to load the server's configuration
    local server_path = 'core.lsp.configs.' .. server_name

    local success, config = pcall(require, server_path)

    -- If the configuration doesn't exist, use an empty table
    if not success then config = {} end

    server.setup(config)
  end,
}

-- AutoFormatting
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

-- AutoDiagnostic on Hover
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({focusable = false})]]
