local function get_diagnostics_for_current_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum, _ = unpack(vim.api.nvim_win_get_cursor(0))
  lnum = lnum - 1

  -- Get diagnostics for the current buffer and line number
  local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
  return line_diagnostics
end

M = {}

function M.copy_diagnostic_to_clipboard()
  local diagnostics = get_diagnostics_for_current_line()
  local error_message = ""
  for _, diagnostic in ipairs(diagnostics) do
    if string.len(error_message) > 0 then
      error_message = error_message .. "\n"
    end
    error_message = error_message .. diagnostic.message
  end

  -- Copy the error message to the system clipboard
  vim.fn.setreg('*', error_message)
end

return M
