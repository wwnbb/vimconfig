return {
	"wwnbb/opencode.nvim",
	build = "sh scripts/install-tools.sh",
	config = function()
		require("opencode").setup({
			server = {
				reuse_running = false,
				shutdown_on_exit = true,
			},
			chat = {
				layout = "horizontal", -- "vertical" | "horizontal" | "float"
				-- position = "", -- "left" | "right" | "top" | "bottom"
				-- width = 80,
				-- height = 20,
				--
				message_display = {
					user_prefix = "│ ",
					multiline_prefix = true,
				},
			},

			lualine = {
				enabled = true,
				mode = "normal",
				show_model = true,
				show_agent = true,
				show_status = true,
				show_message_count = true,
			},
			diff = {
				layout = "vertical",
				file_list_width = 30,
			},

			keymaps = {
				toggle = "<leader>ot",
				command_palette = "<leader>op",
				show_diff = "<leader>od",
				abort = "<leader>ox",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "opencode",
			callback = function()
				vim.opt_local.wrap = true
				vim.opt_local.linebreak = true
			end,
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
