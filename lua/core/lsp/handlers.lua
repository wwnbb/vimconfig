vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  end
})

local _border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border,
    focusable = false
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border,
    focusable = false
  }
)

local diagnostic_float_augroup = vim.api.nvim_create_augroup("diagnostic_hover", { clear = true })

local function open_diagnostic_hover()
  local _, winid = vim.diagnostic.open_float(nil, {
    border = _border,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    focusable = false,
    max_width = 80,
    scope = "cursor",
    source = "always",
  })

  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_option_value("wrap", true, { win = winid })
    vim.api.nvim_set_option_value("linebreak", true, { win = winid })
  end
end

vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic_float_augroup,
  callback = open_diagnostic_hover,
})

vim.diagnostic.config {
  float = {
    border = _border,
  }
}
