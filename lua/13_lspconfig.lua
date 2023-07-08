vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]]

local lspconfig = require 'lspconfig'

local configs = require 'lspconfig.configs'

configs.solidity = {
  default_config = {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}

lspconfig.solidity.setup {}

local function pyright_setup()
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
end

lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "typescriptreact", "less", "sass", "scss",
    "svelte", "pug",
    "typescriptreact", "vue" },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if server_name == "pyright" then
      pyright_setup()
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
