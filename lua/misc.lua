local api = vim.api


api.nvim_create_autocmd("FileType",
  { pattern = { "help", "startuptime", "lspinfo", "neotest-output"}, command = [[nnoremap <buffer><silent> q :close<CR>]] }
  )

api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format { async = false }
    end
  })


vim.g.copilot_filetypes = {
  ['*'] = false,
  ['javascript'] = true,
  ['typescript'] = true,
  ['vue'] = true,
  ['lua'] = true,
  ['html'] = true,
  ['python'] = true,
  ['go'] = true,
  ['golang'] = true,
}

vim.g.copilot_no_tab_map = true
