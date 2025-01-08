require('git-conflict').setup(
  {
    highlights = {
      incoming = 'DiffText',
      current = 'DiffAdd',
    },
    disable_diagnostics = false,
  }
)

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in ' .. vim.fn.expand('<afile>'))
    vim.cmd("GitConflictRefresh")
    vim.keymap.set('n', '<leader>a', '<Plug>(git-conflict-ours)')
    vim.keymap.set('n', '<leader>e', '<Plug>(git-conflict-theirs)')
    vim.keymap.set('n', '<leader>o', '<Plug>(git-conflict-both)')
    vim.keymap.set('n', '<leader>x', '<Plug>(git-conflict-none)')
    vim.keymap.set('n', '<leader>cp', '<Plug>(git-conflict-prev-conflict)')
    vim.keymap.set('n', '<leader>cn', '<Plug>(git-conflict-next-conflict)')
  end
})
