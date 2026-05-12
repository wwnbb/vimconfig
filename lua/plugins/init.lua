return {
	"Shougo/neosnippet-snippets",
	"sheerun/vim-polyglot",
	"isobit/vim-caddyfile",
	"neovim/nvim-lspconfig",
	"SirVer/ultisnips",
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	"terrortylor/nvim-comment",
	"nvim-tree/nvim-tree.lua",
	"ishan9299/nvim-solarized-lua",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
	},
	{
		"krivahtoo/silicon.nvim",
		build = "./install.sh build",
	},
	"tpope/vim-fugitive",
	"rbong/vim-flog",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"sopa0/telescope-makefile",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			local tele = require("telescope")
			tele.load_extension("fzf")
			tele.load_extension("dap")
			tele.load_extension("gh")
		end,
	},
	"echasnovski/mini.nvim",
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({ input_buffer_type = "dressing" })
		end,
	},
	"stevearc/dressing.nvim",
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
	},
	{
		"catgoose/nvim-colorizer.lua",
		init = function()
			vim.opt.termguicolors = true
		end,
	},
	"ellisonleao/glow.nvim",
	"wwnbb/dark-notify",
	"lewis6991/gitsigns.nvim",

	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
	{
		"michaelb/sniprun",
		branch = "master",

		build = "sh install.sh",
		-- do 'sh install.sh 1' if you want to force compile locally
		-- (instead of fetching a binary from the github release). Requires Rust >= 1.65

		config = function()
			require("sniprun").setup({
				display = { "TempFloatingWindow" },
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^7",
		lazy = false,
	},
}
