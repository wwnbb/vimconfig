vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = '#f9cfbe' })
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = '#d0d9a4' })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = '#7b62a3' })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = '#df2325' })

    vim.api.nvim_set_hl(0, "Pmenu", { bg = '#fdf6e3' })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = '#eee8d5', bold = false })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { underdotted = true })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = '#d0d9a4' })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = '#d0d9a4' })
    vim.api.nvim_set_hl(0, "Visual", { reverse = true, bg = '#002b36' })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { reverse = true, bg = '#eee8d5' })
    vim.api.nvim_set_hl(0, "@variable", { fg = '#586e75' })
  end
})


-- ###################### COLORS ########################
vim.cmd([[hi NeotestPassed guifg=#859900]])
vim.cmd([[hi NeotestFailed guifg=#F70067]])
vim.cmd([[hi NeotestRunning guifg=#268bd2]])
vim.cmd([[hi NeotestSkipped guifg=#2aa198]])
vim.cmd([[hi NeotestFile guifg=#859900]])
vim.cmd([[hi NeotestDir guifg=#268bd2]])
vim.cmd([[hi NeotestNamespace guifg=#d33682]])
vim.cmd([[hi NeotestFocused gui=bold,underline cterm=bold,underline]])
vim.cmd([[hi NeotestIndent guifg=#8B8B8B]])
vim.cmd([[hi NeotestExpandMarker guifg=#8094b4]])
vim.cmd([[hi NeotestAdapterName guifg=#F70067]])
vim.cmd([[hi NeotestWinSelect guifg=#00f1f5 gui=bold]])
vim.cmd([[hi NeotestMarked guifg=#F79000 gui=bold]])
vim.cmd([[hi NeotestTarget guifg=#F70067]])
vim.cmd([[hi NeotestTest guifg=#657b83]])

vim.cmd([[hi CmpItemKind guifg=#839496 guibg=#fdf6e3]])

vim.cmd([[hi CmpItemAbbrMatch guifg=#b58900 guibg=#fdf6e3]])
vim.cmd([[hi CmpItemAbbrMatchFuzzy guifg=#b58900 guibg=#fdf6e3]])

vim.opt.fillchars = { diff = '╱' }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescriptreact",
  callback = function(args)
    vim.cmd([[highlight link @tag NONE]])
  end
})
