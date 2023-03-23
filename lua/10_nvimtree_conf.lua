vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = false,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})
