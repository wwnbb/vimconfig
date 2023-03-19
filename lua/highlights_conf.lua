vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    vim.api.nvim_set_hl(0, "DiffDelete", {bg='#f9cfbe'})
    vim.api.nvim_set_hl(0, "DiffAdd", {bg='#d0d9a4'})
    vim.api.nvim_set_hl(0, "DiagnosticHint", {fg='#7b62a3'})
    vim.api.nvim_set_hl(0, "DiagnosticError", {fg='#df2325'})

  end
})

vim.opt.fillchars = {diff = '╱'}
