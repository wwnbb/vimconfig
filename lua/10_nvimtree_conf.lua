vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  enable_git_status = true,
  sort_by = "case_sensitive",
  disable_netrw = false,
  use_libuv_file_watcher = true,
  follow_current_file = true, -- This will find and focus the file in the active buffer every
  -- time the current file is changed while the tree is open.
  group_empty_dirs = false,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true,    -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["+"]  = "git_unstage_file",
        ["-"]  = "git_add_file",
        ["U"]  = "git_revert_file",
        ["cc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  },
})
