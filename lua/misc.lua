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
