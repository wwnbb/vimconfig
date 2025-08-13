local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
			},
		},
		git_branches = {
			git_command = "git branch",
		},
	},
	pickers = {
		lsp_references = {
			theme = "ivy",
		},
		lsp_definitions = {
			theme = "ivy",
		},
		git_branches = {
			cmd = { "git", "branch", "--format", "%(refname:lstrip=2)" },
		},
	},
	extensions = {},
})
