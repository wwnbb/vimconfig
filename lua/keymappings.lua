local tailwind_classes_fold = require("tailwind-classes-fold")
local keyset = vim.keymap.set

local copy_diagnostic = require("utils.copy_diagnostic")

local function toggle_star_selection()
	if vim.fn.getreg("/") ~= "" then
		vim.fn.setreg("/", "")
	else
		pcall(vim.cmd, "normal! mi*`i<CR>")
	end
end

-- Map the * key to call the toggle_star_selection function
keyset("n", "*", toggle_star_selection, { noremap = true, silent = true })

vim.cmd("nnoremap <silent> # :nohl<CR>")

local api = require("nvim-tree.api")

local function hide_opencode_chat()
	local ok, opencode = pcall(require, "opencode")
	if ok and type(opencode.close) == "function" then
		opencode.close()
	end
end

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

keyset("n", "K", function()
	vim.lsp.buf.hover({
		border = border,
		focusable = true,
		max_width = 80,
		relative = "cursor",
		anchor_bias = "below",
	})
end, { noremap = true, silent = true })

local function explore()
	-- path = vim.fn.expand("%")
	hide_opencode_chat()
	api.tree.toggle({ find_file = true, focus = true, path = "<arg>" })
end
keyset("n", "<space>n", explore, { noremap = true, silent = true })

local function plenary_test_file()
	require("plenary.test_harness").test_directory(vim.fn.expand("%:p"))
end
keyset("n", "<space>tl", plenary_test_file, { noremap = true })

keyset("n", "zt", function()
	tailwind_classes_fold.toggle_conceal()
end)

-- TELESCOPE
local telescope = require("telescope")
local tele = require("telescope.builtin")
local cursor_theme = require("telescope.themes").get_cursor({})
local ivy_theme = require("telescope.themes").get_ivy({})
local github = telescope.extensions.gh
local bufopts = { noremap = true, silent = true }

keyset("n", "<space>f", tele.find_files, {})
keyset("v", "<space>S", tele.grep_string, {})
keyset("n", "<space>S", tele.live_grep, {})
keyset("n", "<space>t", tele.resume, {})
keyset("n", "<space>s", tele.lsp_dynamic_workspace_symbols, { noremap = true, silent = true })
keyset("n", "<space>b", tele.buffers, {})
keyset("n", "<space>gb", tele.git_branches, {})
keyset("n", "<space>gc", function()
	require("telescope.builtin").git_commits()
end, { noremap = true, silent = true })
keyset("n", "<space>h", tele.help_tags, {})

keyset("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

keyset("n", "gd", ":Telescope lsp_definitions theme=ivy<CR>", { noremap = true, silent = true })

keyset("n", "gr", ":Telescope lsp_references theme=ivy<CR>", { noremap = true, silent = true })

keyset("n", "gi", ":Telescope lsp_implementations theme=ivy<CR>", { noremap = true, silent = true })

keyset("n", "<space>m", ":Telescope make theme=ivy<CR>", {})

keyset("n", "<leader>a", vim.lsp.buf.code_action, bufopts)

keyset("n", "<leader>lc", function()
	local file_path = vim.fn.expand("%:p")
	local line_number = vim.fn.line(".")
	local full_path_with_line = file_path .. ":" .. line_number
	vim.fn.setreg("+", full_path_with_line)
	vim.notify("Copied: " .. full_path_with_line, vim.log.levels.INFO)
end, { noremap = true, silent = true })

keyset("n", "<F3>", "", {
	noremap = true,
	callback = function()
		local set = vim.opt
		set.number = not set.number:get()
		set.relativenumber = set.number:get()
	end,
})

local function github_menu()
	github.run({})
end

keyset("n", "<space>tg", github_menu, {})

-- LSP
keyset("n", "<space>r", vim.lsp.buf.rename, {})

keyset("n", "<space>e", copy_diagnostic.copy_diagnostic_to_clipboard, { silent = true })

-- nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
keyset("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

local function toggle_diagnostics()
	if vim.diagnostic.config().virtual_text then
		vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })
	else
		vim.diagnostic.config({ virtual_text = true, signs = true, underline = true })
	end
end

keyset("n", "<leader>lt", toggle_diagnostics, { noremap = true, silent = true })

keyset("n", "<space><space>", function()
	vim.cmd("Noice dismiss")
end, { noremap = true, silent = true })

local function open_input_at_end()
	local input = require("opencode.ui.input")
	local oc = require("opencode")

	local pending = input.get_pending_text()
	if pending ~= "" and not pending:match("\n$") then
		input.set_pending_text(pending .. "\n")
	end

	oc.focus_input()

	local function focus_input_window()
		for _, win in ipairs(input.get_winids()) do
			if vim.api.nvim_win_is_valid(win) then
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].filetype == "opencode_input" then
					local last = vim.api.nvim_buf_line_count(buf)
					vim.api.nvim_set_current_win(win)
					vim.api.nvim_win_set_cursor(win, { last, 0 })
					vim.api.nvim_win_call(win, function()
						vim.cmd("normal! zb")
					end)
					vim.cmd("startinsert!")
					return true
				end
			end
		end
		return false
	end

	local function focus_when_ready(attempt)
		if focus_input_window() then
			return
		end
		if attempt >= 20 then
			return
		end
		vim.defer_fn(function()
			focus_when_ready(attempt + 1)
		end, 10)
	end

	vim.schedule(function()
		focus_when_ready(1)
	end)
end

local function add_current_line(open_input)
	local oc = require("opencode")
	oc.add_current_line_to_input({ send = false })
	if open_input then
		open_input_at_end()
	end
end

local function add_visual_selection(open_input)
	local oc = require("opencode")

	-- leave visual first so '< and '> become current selection
	vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)

	vim.schedule(function()
		oc.add_visual_selection_to_input({ send = false })
		if open_input then
			open_input_at_end()
		end
	end)
end

-- open input
keyset("n", "<leader>oe", function()
	add_current_line(true)
end, { desc = "OpenCode add line + open context input", silent = true })
keyset("x", "<leader>oe", function()
	add_visual_selection(true)
end, { desc = "OpenCode add selection + open context input", silent = true })

keyset("n", "<leader>oa", function()
	add_current_line(false)
end, { desc = "OpenCode add line", silent = true })
keyset("x", "<leader>oa", function()
	add_visual_selection(false)
end, { desc = "OpenCode add selection", silent = true })
