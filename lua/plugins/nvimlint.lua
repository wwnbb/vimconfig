return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local mypy = lint.linters.mypy
		local lspconfig_util = require("lspconfig.util")
		local filename = vim.api.nvim_buf_get_name(0)
		local root_dir = lspconfig_util.find_git_ancestor(filename)
		root_dir = root_dir
			or lspconfig_util.root_pattern("setup.py", "pyproject.toml", "setup.cfg", "requirements.txt")(filename)
		local venv_path = root_dir .. "/.venv/bin/"

		mypy.cmd = venv_path .. "mypy"

		mypy.args = vim.list_extend(mypy.args, {
			function()
				root_dir = root_dir or lspconfig_util.root_pattern("*.py")(filename)
				local cache_dir = root_dir .. ".mypy_cache"
				return "--cache-dir=" .. cache_dir .. " --python-executable=" .. venv_path .. "python"
			end,
		})

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "mypy", "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
