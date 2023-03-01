local keyset = vim.keymap.set

-- Define a function to show the LSP documentation
function show_lsp_documentation()
  vim.lsp.buf.hover()
end

-- Bind the show_lsp_documentation function to the K key
keyset('n', 'K', show_lsp_documentation, { noremap = true, silent = true })

keyset('n', '<space>e', vim.diagnostic.open_float, opts)

keyset("n", "<Space>n", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

local bufopts = { noremap=true, silent=true}
keyset('n', '=f', function() vim.lsp.buf.format { async = true } end, bufopts)
