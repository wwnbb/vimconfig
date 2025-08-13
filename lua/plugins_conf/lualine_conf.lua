-- Eviline config for lualine with Solarized themes
local lualine = require("lualine")
local color_utils = require("utils.colors")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Function to get the project root directory
local function get_project_root()
	local filepath = vim.fn.expand("%:p:h")
	local gitdir = vim.fn.finddir(".git", filepath .. ";")
	if gitdir and #gitdir > 0 and #gitdir < #filepath then
		return vim.fn.fnamemodify(gitdir, ":h")
	end
	return nil
end

-- Function to get the relative file path from the project root
local function get_relative_file_path()
	local root = get_project_root()
	if root then
		local filepath = vim.fn.expand("%:p")
		return vim.fn.fnamemodify(filepath, ":~:."):gsub("^" .. vim.fn.escape(root, "\\") .. "/", "")
	end
	return vim.fn.expand("%:p:~:.")
end

-- Create config with dynamic colors
local function create_config()
	local colors = color_utils.get_colors()

	local config = {
		options = {
			disabled_filetypes = {
				statusline = { "NvimTree", "Avante", "AvanteInput" },
				winbar = { "NvimTree", "Avante", "AvanteInput" },
			},
			component_separators = "",
			section_separators = { left = "", right = "" },
			theme = {
				normal = {
					a = { bg = colors.fg, fg = colors.cyan, gui = "bold" },
					b = { bg = colors.background, fg = colors.text },
					c = { bg = colors.background, fg = colors.text },
				},
				inactive = {
					a = { bg = colors.fg, fg = colors.text },
					b = { bg = colors.background, fg = colors.text },
					c = { bg = colors.background, fg = colors.text },
				},
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x at right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return "▊"
		end,
		color = { fg = colors.blue },
		padding = { left = 0, right = 1 },
	})

	ins_left({
		-- mode component
		function()
			local mode_map = {
				n = "NORMAL",
				i = "INSERT",
				v = "VISUAL",
				[""] = "V-BLOCK",
				V = "V-LINE",
				c = "COMMAND",
				no = "NORMAL",
				s = "SELECT",
				S = "S-LINE",
				[""] = "S-BLOCK",
				ic = "INSERT",
				R = "REPLACE",
				Rv = "V-REPLACE",
				cv = "VIM EX",
				ce = "EX",
				r = "PROMPT",
				rm = "MORE",
				["r?"] = "CONFIRM",
				["!"] = "SHELL",
				t = "TERMINAL",
			}
			return mode_map[vim.fn.mode()]
		end,
		color = function()
			local mode_color = {
				n = colors.blue, -- Normal
				i = colors.green, -- Insert
				v = colors.magenta, -- Visual
				[""] = colors.magenta, -- Visual Block
				V = colors.magenta, -- Visual Line
				c = colors.violet, -- Command
				no = colors.blue, -- Normal
				s = colors.orange, -- Select
				S = colors.orange, -- Select Line
				[""] = colors.orange, -- Select Block
				ic = colors.yellow, -- Insert completion
				R = colors.red, -- Replace
				Rv = colors.red, -- Virtual Replace
				cv = colors.red, -- Ex mode
				ce = colors.red, -- Normal Ex
				r = colors.cyan, -- Prompt
				rm = colors.cyan, -- More
				["r?"] = colors.cyan, -- Confirm
				["!"] = colors.blue, -- Shell
				t = colors.blue, -- Terminal
			}
			return { bg = mode_color[vim.fn.mode()], fg = colors.text_highlight }
		end,
		padding = { right = 1, left = 1 },
	})
	ins_left({ "macro_recording", "%S", color = { fg = colors.cyan, bg = colors.text_highlight, gui = "bold" } })
	ins_left({
		"filesize",
		cond = conditions.buffer_not_empty,
		color = { bg = colors.background, fg = colors.text },
	})

	-- Add the relative file path component
	ins_left({
		function()
			return get_relative_file_path()
		end,
		cond = conditions.buffer_not_empty,
		color = { bg = colors.background, fg = colors.text, gui = "bold" },
	})

	ins_left({
		"location",
		color = { bg = colors.background, fg = colors.text },
	})

	ins_left({
		"progress",
		color = { bg = colors.background, fg = colors.text, gui = "bold" },
	})

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " " },
		diagnostics_color = {
			error = { fg = colors.red },
			warn = { fg = colors.yellow },
			info = { fg = colors.cyan },
		},
		color = { fg = colors.text },
	})

	ins_left({
		function()
			return "%="
		end,
	})

	ins_right({
		"o:encoding",
		fmt = string.upper,
		cond = conditions.hide_in_width,
		color = { bg = colors.background, fg = colors.text, gui = "bold" },
	})

	ins_right({
		"fileformat",
		fmt = string.upper,
		icons_enabled = false,
		color = { fg = colors.text, bg = colors.background, gui = "bold" },
	})

	ins_right({
		"branch",
		icon = "",
		color = { fg = colors.text, bg = colors.background, gui = "bold" },
	})

	ins_right({
		"diff",
		symbols = { added = " ", modified = "󰝤 ", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
		cond = conditions.hide_in_width,
		color = { fg = colors.text },
	})

	ins_right({
		function()
			return "▊"
		end,
		color = { fg = colors.blue },
		padding = { left = 1 },
	})

	return config
end

-- Setup lualine with auto-updating colors
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		lualine.setup(create_config())
	end,
})

-- Initial setup
lualine.setup(create_config())
