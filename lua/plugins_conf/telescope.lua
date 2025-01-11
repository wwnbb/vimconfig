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
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {},
})

vim.print(telescope.extensions)


require("telescope-makefile").setup({
	makefile_priority = { ".", "build/" },
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
		local normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")

		-- Telescope highlight groups
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = normal_bg, fg = normal_fg })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = normal_bg, fg = normal_fg })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = normal_bg, fg = normal_fg })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = normal_bg, fg = normal_fg })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = normal_fg, fg = normal_bg })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = normal_fg, fg = normal_bg })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = normal_fg, fg = normal_bg })

		-- Slightly darker background for the prompt
		local prompt_bg = vim.fn.synIDattr(vim.fn.hlID("Pmenu"), "bg")
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = prompt_bg, fg = normal_fg })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = prompt_bg, fg = normal_fg })

		-- Selection highlights
		local selection_bg = vim.fn.synIDattr(vim.fn.hlID("Visual"), "bg")
		local selection_fg = vim.fn.synIDattr(vim.fn.hlID("Visual"), "fg")
		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = selection_bg, fg = selection_fg })
	end,
})
