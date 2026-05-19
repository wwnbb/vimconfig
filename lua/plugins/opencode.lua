local function get_opencode_tab_colors()
	if vim.go.background == "dark" then
		return {
			active_bg = "#304d63",
			active_fg = "#fdf6e3",

			inactive_bg = "#073642",
			inactive_fg = "#93a1a1",

			running_fg = "#b8cc52",
			waiting_fg = "#ffb454",
			error_fg = "#ff5f56",
			idle_fg = "#839496",

			active_running_fg = "#d0d94a",
			active_waiting_fg = "#ffc777",
			active_error_fg = "#fca5a5",
			active_idle_fg = "#fdf6e3",
		}
	end

	return {
		active_bg = "#335c67",
		active_fg = "#fdf6e3",

		inactive_bg = "#eee8d5",
		inactive_fg = "#657b83",

		running_fg = "#6f7f00",
		waiting_fg = "#a66f00",
		error_fg = "#c23b22",
		idle_fg = "#657b83",

		active_running_fg = "#d0d94a",
		active_waiting_fg = "#ffc777",
		active_error_fg = "#fca5a5",
		active_idle_fg = "#fdf6e3",
	}
end

local function apply_opencode_highlights()
	local tab = get_opencode_tab_colors()

	vim.api.nvim_set_hl(0, "OpenCodeWinbar", {
		fg = tab.inactive_fg,
		bg = tab.inactive_bg,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarRunning", {
		fg = tab.running_fg,
		bg = tab.inactive_bg,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarWaiting", {
		fg = tab.waiting_fg,
		bg = tab.inactive_bg,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarError", {
		fg = tab.error_fg,
		bg = tab.inactive_bg,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarIdle", {
		fg = tab.idle_fg,
		bg = tab.inactive_bg,
	})

	vim.api.nvim_set_hl(0, "OpenCodeWinbarCurrent", {
		fg = tab.active_fg,
		bg = tab.active_bg,
		bold = true,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarCurrentRunning", {
		fg = tab.running_fg,
		bg = tab.active_bg,
		bold = true,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarCurrentWaiting", {
		fg = tab.waiting_fg,
		bg = tab.active_bg,
		bold = true,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarCurrentError", {
		fg = tab.error_fg,
		bg = tab.active_bg,
		bold = true,
	})
	vim.api.nvim_set_hl(0, "OpenCodeWinbarCurrentIdle", {
		fg = tab.idle_fg,
		bg = tab.active_bg,
		bold = true,
	})
end

local function apply_opencode_highlights_later()
	vim.schedule(apply_opencode_highlights)
end

return {
	"wwnbb/opencode.nvim",
	dev = true,
	build = "sh scripts/install-tools.sh",
	config = function()
		require("opencode").setup({
			server = {
				reuse_running = false,
				shutdown_on_exit = true,
			},
			chat = {
				layout = "float", -- "vertical" | "horizontal" | "float"
				-- position = "", -- "left" | "right" | "top" | "bottom"
				-- width = 80,
				-- height = 20,
				--
				message_display = {
					user_prefix = "│ ",
					multiline_prefix = true,
				},
				session_tabs = {
					colors = get_opencode_tab_colors,
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

		apply_opencode_highlights()

		local opencode_hl_group = vim.api.nvim_create_augroup("OpenCodeSolarizedHighlights", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = opencode_hl_group,
			callback = apply_opencode_highlights_later,
			desc = "Refresh OpenCode highlights after colorscheme changes",
		})
		vim.api.nvim_create_autocmd("OptionSet", {
			group = opencode_hl_group,
			pattern = "background",
			callback = apply_opencode_highlights_later,
			desc = "Refresh OpenCode highlights after background changes",
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
