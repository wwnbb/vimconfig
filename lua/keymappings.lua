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

-- Opencode Keympas
local oc = require("opencode")

keyset("n", "<leader>oe", oc.add_current_line_and_open_input, {})
keyset("x", "<leader>oe", oc.add_visual_selection_and_open_input, {})
keyset("n", "<leader>oa", oc.add_current_line, {})
keyset("x", "<leader>oa", oc.add_visual_selection, {})
