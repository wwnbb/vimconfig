vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function hide_opencode_chat()
  local ok, opencode = pcall(require, "opencode")
  if ok and type(opencode.close) == "function" then
    opencode.close()
  end
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("NvimTreeHideOpenCode", { clear = true }),
  pattern = "NvimTree",
  callback = hide_opencode_chat,
})
